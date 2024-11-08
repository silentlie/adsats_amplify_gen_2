import { defineAuth } from "@aws-amplify/backend";
import { createUser } from "../data/cognito-admin/create-user/resource";
import { deleteUser } from "../data/cognito-admin/delete-user/resouce";
import { enableUser } from "../data/cognito-admin/enable-user/resouce";
import { disableUser } from "../data/cognito-admin/disable-user/resouce";

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
  access: (allow) => [
    allow.resource(createUser).to(["createUser"]),
    allow.resource(deleteUser).to(["deleteUser"]),
    allow.resource(enableUser).to(["enableUser"]),
    allow.resource(disableUser).to(["disableUser"]),
  ],
});
