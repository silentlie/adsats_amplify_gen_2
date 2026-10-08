import { defineBackend } from "@aws-amplify/backend";
import { PolicyStatement } from "aws-cdk-lib/aws-iam";
import { auth } from "./auth/resource";
import { data } from "./data/resource";
import { storage } from "./storage/resource";
import { runReminderDispatch } from "./data/run-reminder-dispatch/resource";
import { sendNotificationEmail } from "./data/send-notification-email/resource";

const backend = defineBackend({
  auth,
  data,
  storage,
  runReminderDispatch,
  sendNotificationEmail,
});

backend.sendNotificationEmail.resources.lambda.addToRolePolicy(
  new PolicyStatement({
    actions: ["ses:SendEmail"],
    resources: ["arn:aws:ses:us-west-2:891377389351:identity/adsats.com"],
  }),
);

// extract L1 CfnUserPool resources
const { cfnUserPool } = backend.auth.resources.cfnResources;
// modify cfnUserPool policies directly
cfnUserPool.policies = {
  passwordPolicy: {
    minimumLength: 8,
    requireLowercase: true,
    requireNumbers: true,
    requireSymbols: true,
    requireUppercase: true,
    temporaryPasswordValidityDays: 30,
  },
};
