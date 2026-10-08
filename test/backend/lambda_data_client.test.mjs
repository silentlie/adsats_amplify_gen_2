import assert from "node:assert/strict";
import { mkdtemp, readFile, rm, writeFile } from "node:fs/promises";
import { dirname, join, resolve, sep } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";
import { test } from "node:test";
import { build } from "esbuild";

const fixtureRoot = dirname(fileURLToPath(import.meta.url));
const outputs = JSON.parse(await readFile(
  new URL("../../amplify_outputs.json", import.meta.url), "utf8",
));
let fixtureId = 0;

async function loadClient(directory, fixture) {
  const key = `lambdaDataClientFixture${fixtureId++}`;
  const fixtureDir = await mkdtemp(join(fixtureRoot, ".lambda-client-"));
  const fixtureFile = join(fixtureDir, "client.mjs");
  globalThis[key] = fixture;
  try {
    const result = await build({
      entryPoints: [fileURLToPath(new URL(
        `../../amplify/data/${directory}/amplifyClient.ts`, import.meta.url,
      ))],
      bundle: true,
      platform: "node",
      format: "esm",
      packages: "external",
      write: false,
      plugins: [{
        name: "lambda-runtime-config",
        setup(builder) {
          builder.onResolve({ filter: /^\$amplify\/env\// }, (args) => ({
            path: args.path, namespace: "lambda-env",
          }));
          builder.onLoad({ filter: /.*/, namespace: "lambda-env" }, () => ({
            contents: "export const env = {};", loader: "js",
          }));
          builder.onResolve({ filter: /^@aws-amplify\/backend\/function\/runtime$/ },
            (args) => ({ path: args.path, namespace: "lambda-config" }));
          builder.onLoad({ filter: /.*/, namespace: "lambda-config" }, () => ({
            contents: `export const getAmplifyDataClientConfig = async () =>
              globalThis[${JSON.stringify(key)}];`,
            loader: "js",
          }));
        },
      }],
    });
    await writeFile(fixtureFile, result.outputFiles[0].text);
    return (await import(pathToFileURL(fixtureFile).href)).client;
  } finally {
    delete globalThis[key];
    const resolvedDir = resolve(fixtureDir);
    assert.ok(resolvedDir.startsWith(resolve(fixtureRoot) + sep));
    await rm(resolvedDir, { recursive: true, force: true });
  }
}

for (const directory of ["send-notification-email", "run-reminder-dispatch"]) {
  test(`${directory} signs data requests with Lambda credentials and honors rotation`, async () => {
    let credentials = {
      accessKeyId: "test-key", secretAccessKey: "test-secret", sessionToken: "test-token",
    };
    const requests = [];
    const originalFetch = globalThis.fetch;
    globalThis.fetch = async (input, options) => {
      assert.equal(String(input), "https://example.com/graphql");
      requests.push(options);
      return new Response(JSON.stringify({
        data: { getNotice: { id: "notice", subject: "Notification", archived: false } },
      }), { status: 200, headers: { "content-type": "application/json" } });
    };

    try {
      const client = await loadClient(directory, {
        resourceConfig: {
          API: { GraphQL: {
            endpoint: "https://example.com/graphql",
            region: "ap-southeast-2",
            defaultAuthMode: "iam",
            modelIntrospection: outputs.data.model_introspection,
          } },
        },
        libraryOptions: { Auth: { credentialsProvider: {
          getCredentialsAndIdentityId: async () => ({ credentials }),
          clearCredentialsAndIdentityId() {},
        } } },
      });
      const getNotice = () => client.models.Notice.get({ id: "notice" }, {
        selectionSet: ["id", "subject", "archived"],
      });

      assert.equal((await getNotice()).data.id, "notice");
      const firstHeaders = new Headers(requests[0].headers);
      assert.match(firstHeaders.get("authorization"), /AWS4-HMAC-SHA256 Credential=test-key\//);
      assert.equal(firstHeaders.get("x-amz-security-token"), "test-token");

      credentials = { ...credentials, accessKeyId: "rotated-key", sessionToken: "rotated-token" };
      assert.equal((await getNotice()).data.id, "notice");
      const secondHeaders = new Headers(requests[1].headers);
      assert.match(secondHeaders.get("authorization"), /Credential=rotated-key\//);
      assert.equal(secondHeaders.get("x-amz-security-token"), "rotated-token");

      credentials = undefined;
      await assert.rejects(getNotice(), /No credentials/);
      assert.equal(requests.length, 2);
    } finally {
      globalThis.fetch = originalFetch;
    }
  });
}
