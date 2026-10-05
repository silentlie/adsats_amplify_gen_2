import assert from "node:assert/strict";
import { createRequire } from "node:module";
import { fileURLToPath } from "node:url";
import { test } from "node:test";
import { build } from "esbuild";

const require = createRequire(import.meta.url);
let fixtureId = 0;

// Replace AWS clients while executing the real handler and email templates.
async function loadHandler(directory, dependencies) {
  const key = `archiveTest${fixtureId++}`;
  globalThis[key] = dependencies;
  try {
    const result = await build({
      entryPoints: [
        fileURLToPath(
          new URL(
            `../../amplify/data/${directory}/handler.ts`,
            import.meta.url,
          ),
        ),
      ],
      bundle: true,
      platform: "node",
      format: "cjs",
      write: false,
      plugins: [
        {
          name: "fake-aws",
          setup(builder) {
            builder.onResolve(
              { filter: /^\.\/(amplifyClient|emailSender|reminderCleanup)$/ },
              (args) => ({
                path: args.path,
                namespace: "fake-aws",
              }),
            );
            builder.onLoad({ filter: /.*/, namespace: "fake-aws" }, () => ({
              contents: `const deps = globalThis[${JSON.stringify(key)}];
              export const client = deps.client;
              export const sendEmail = deps.sendEmail;
              export const deleteReminderCascade = deps.deleteReminderCascade;`,
              loader: "js",
            }));
          },
        },
      ],
    });
    const module = { exports: {} };
    new Function("module", "exports", "require", result.outputFiles[0].text)(
      module,
      module.exports,
      require,
    );
    return module.exports.handler;
  } finally {
    delete globalThis[key];
  }
}

function person(id, archived = false) {
  return {
    id,
    firstName: id,
    lastName: "Staff",
    email: `${id}@example.com`,
    archived,
  };
}

for (const isNotice of [true, false]) {
  const kind = isNotice ? "notice" : "report";
  const modelName = isNotice ? "Notice" : "Report";
  const event = {
    arguments: {
      id: kind,
      isNotice,
      isReport: !isNotice,
      host: "https://example.com",
    },
  };

  test(`${kind} email excludes archived staff from existing recipient links`, async () => {
    const sent = [];
    let selection;
    const handler = await loadHandler("send-notification-email", {
      client: {
        models: {
          [modelName]: {
            async get(_, options) {
              selection = options.selectionSet;
              return {
                data: {
                  id: kind,
                  subject: "Notification",
                  archived: false,
                  author: person("author"),
                  auditor: person("auditor"),
                  recipients: [
                    { staff: person("active") },
                    { staff: person("archived", true) },
                  ],
                },
              };
            },
          },
        },
      },
      async sendEmail(...args) {
        sent.push(args);
      },
    });

    const results = await handler(event);

    assert.deepEqual(
      sent.map((args) => args[1]),
      ["active@example.com"],
    );
    assert.deepEqual(results, [{ recipient: "active@example.com", ok: true }]);
    assert.ok(selection.includes("archived"));
    assert.ok(selection.includes("recipients.staff.*"));
  });

  test(`archived ${kind} sends no email`, async () => {
    const sent = [];
    const handler = await loadHandler("send-notification-email", {
      client: {
        models: {
          [modelName]: {
            async get() {
              return {
                data: {
                  id: kind,
                  subject: "Archived notification",
                  archived: true,
                  recipients: [{ staff: person("active") }],
                },
              };
            },
          },
        },
      },
      async sendEmail(...args) {
        sent.push(args);
      },
    });

    assert.deepEqual(await handler(event), []);
    assert.deepEqual(sent, []);
  });

  test(`${kind} with only archived recipients sends no email`, async () => {
    const handler = await loadHandler("send-notification-email", {
      client: {
        models: {
          [modelName]: {
            async get() {
              return {
                data: {
                  id: kind,
                  subject: "Notification",
                  archived: false,
                  recipients: [{ staff: person("archived", true) }],
                },
              };
            },
          },
        },
      },
      async sendEmail() {
        assert.fail("Archived recipients must not receive email");
      },
    });
    assert.deepEqual(await handler(event), []);
  });
}

function reminder() {
  return {
    id: "reminder",
    date: "2026-01-01T00:00:00.000Z",
    document: {
      id: "document",
      name: "Document",
      archived: false,
      expiredAt: "2027-01-01T00:00:00.000Z",
      subcategory: {
        id: "subcategory",
        name: "Subcategory",
        archived: false,
        category: { id: "category", name: "Category", archived: false },
      },
    },
    staff: [
      { staff: person("active") },
      { staff: person("archived", true) },
      { staff: null },
    ],
  };
}

async function reminderHandler(record, sendError) {
  const sent = [];
  const deleted = [];
  let selection;
  const handler = await loadHandler("run-reminder-dispatch", {
    client: {
      models: {
        Reminder: {
          async list(options) {
            selection = options.selectionSet;
            return { data: [record] };
          },
        },
      },
    },
    async sendEmail(args) {
      sent.push(args);
      if (sendError) throw sendError;
    },
    async deleteReminderCascade(id) {
      deleted.push(id);
    },
  });
  await handler();
  return { sent, deleted, selection };
}

test("due reminder emails only active recipients and is deleted after success", async () => {
  const { sent, deleted, selection } = await reminderHandler(reminder());
  assert.deepEqual(
    sent.map((email) => email.recipients),
    [["active@example.com"]],
  );
  assert.deepEqual(deleted, ["reminder"]);
  for (const field of [
    "document.archived",
    "document.subcategory.archived",
    "document.subcategory.category.archived",
    "staff.staff.archived",
  ]) {
    assert.ok(selection.includes(field));
  }
});

for (const level of ["document", "subcategory", "category"]) {
  test(`an archived ${level} prevents reminder delivery and preserves the reminder`, async () => {
    const record = reminder();
    const entity = {
      document: record.document,
      subcategory: record.document.subcategory,
      category: record.document.subcategory.category,
    }[level];
    entity.archived = true;
    const { sent, deleted } = await reminderHandler(record);
    assert.deepEqual(sent, []);
    assert.deepEqual(deleted, []);
  });
}

for (const recipients of [
  [],
  [{ staff: null }],
  [{ staff: person("archived", true) }],
]) {
  test(`a reminder with no active recipients is deleted without email (${JSON.stringify(recipients)})`, async () => {
    const record = reminder();
    record.staff = recipients;
    const { sent, deleted } = await reminderHandler(record);
    assert.deepEqual(sent, []);
    assert.deepEqual(deleted, [record.id]);
  });
}

test("a reminder without active recipients is cleaned up even when its document is archived", async () => {
  const record = reminder();
  record.document.archived = true;
  record.staff = [];
  const { sent, deleted } = await reminderHandler(record);
  assert.deepEqual(sent, []);
  assert.deepEqual(deleted, [record.id]);
});

test("an active recipient without an email retains the reminder for correction", async () => {
  const record = reminder();
  record.staff = [{ staff: { ...person("active"), email: "" } }];
  const { sent, deleted } = await reminderHandler(record);
  assert.deepEqual(sent, []);
  assert.deepEqual(deleted, []);
});

test("a reminder is preserved when every active recipient email fails", async () => {
  const { sent, deleted } = await reminderHandler(
    reminder(),
    new Error("SES failure"),
  );
  assert.deepEqual(
    sent.map((email) => email.recipients),
    [["active@example.com"]],
  );
  assert.deepEqual(deleted, []);
});
