import { defineAuth } from "@aws-amplify/backend";
import { listUsers } from "../data/list-users/resource";
import { postConfirmation } from "./post-confirmation/resouce";

/**
 * Define and configure your auth resource
 * @see https://docs.amplify.aws/gen2/build-a-backend/auth
 */
export const auth = defineAuth({
  loginWith: {
    email: {
      verificationEmailStyle: "CODE",
      verificationEmailSubject: "Welcome to ADSATS!",
      verificationEmailBody: (createCode) => {
        return `Use this code to confirm your account: ${createCode()}`;
      },
      userInvitation: {
        emailSubject: "Welcome to ADSATS!",
        emailBody: (user, code) => {
          return `We're happy to have you! You can now login with username ${user()} and temporary password ${code()}`;
        },
      },
    },
  },
  userAttributes: {
    fullname: {
      mutable: true,
      required: true,
    },
  },
  groups: ["admins"],
  access: (allow) => [
    allow.resource(listUsers).to(["listUsers"]),
  ],
  triggers: {
    postConfirmation,
  },
});
