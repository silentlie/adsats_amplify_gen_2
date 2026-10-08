import assert from "node:assert/strict";
import { createRequire } from "node:module";
import { fileURLToPath } from "node:url";
import { test } from "node:test";
import { App, Stack } from "aws-cdk-lib";
import { Template } from "aws-cdk-lib/assertions";
import { Code, Function, Runtime } from "aws-cdk-lib/aws-lambda";
import { build } from "esbuild";

const require = createRequire(import.meta.url);

test("notification Lambda receives SES permission for the ADSATS identity", async () => {
  const app = new App();
  const stack = new Stack(app, "NotificationPermissions");
  const emailLambda = new Function(stack, "NotificationEmail", {
    runtime: Runtime.NODEJS_22_X,
    handler: "index.handler",
    code: Code.fromInline("exports.handler = async () => [];"),
  });
  const key = "notificationPermissionsFixture";
  const resources = {
    auth: { resources: { cfnResources: { cfnUserPool: {} } } },
    data: {},
    storage: {},
    runReminderDispatch: {},
    sendNotificationEmail: { resources: { lambda: emailLambda } },
  };
  const fixture = { resources, registered: null };
  globalThis[key] = fixture;

  try {
    const overrides = new Set([
      "@aws-amplify/backend",
      "./auth/resource",
      "./data/resource",
      "./storage/resource",
      "./data/run-reminder-dispatch/resource",
      "./data/send-notification-email/resource",
    ]);
    const result = await build({
      entryPoints: [
        fileURLToPath(new URL("../../amplify/backend.ts", import.meta.url)),
      ],
      bundle: true,
      platform: "node",
      format: "cjs",
      packages: "external",
      write: false,
      plugins: [{
        name: "backend-resources",
        setup(builder) {
          builder.onResolve({ filter: /.*/ }, (args) =>
            overrides.has(args.path)
              ? { path: args.path, namespace: "backend-resources" }
              : undefined,
          );
          builder.onLoad({ filter: /.*/, namespace: "backend-resources" }, () => ({
            contents: `const fixture = globalThis[${JSON.stringify(key)}];
              export const { auth, data, storage, runReminderDispatch,
                sendNotificationEmail } = fixture.resources;
              export const defineBackend = (registered) => {
                fixture.registered = registered;
                return fixture.resources;
              };`,
            loader: "js",
          }));
        },
      }],
    });
    const module = { exports: {} };
    new globalThis.Function("module", "exports", "require", result.outputFiles[0].text)(
      module,
      module.exports,
      require,
    );

    Template.fromStack(stack).hasResourceProperties("AWS::IAM::Policy", {
      PolicyDocument: {
        Statement: [{
          Action: "ses:SendEmail",
          Effect: "Allow",
          Resource: "arn:aws:ses:us-west-2:891377389351:identity/adsats.com",
        }],
        Version: "2012-10-17",
      },
      Roles: [{ Ref: stack.getLogicalId(emailLambda.role.node.defaultChild) }],
    });
    assert.equal(fixture.registered.sendNotificationEmail, resources.sendNotificationEmail);
  } finally {
    delete globalThis[key];
  }
});
