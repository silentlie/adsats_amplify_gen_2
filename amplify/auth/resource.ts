import { defineAuth } from '@aws-amplify/backend';
import { addUserToGroup } from "../data/add-user-to-group/resource"
/**
 * Define and configure your auth resource
 * @see https://docs.amplify.aws/gen2/build-a-backend/auth
 */
export const auth = defineAuth({
  loginWith: {
    email: {
      verificationEmailStyle: "CODE",
      verificationEmailSubject: "Welcome to ADSATS!",
      verificationEmailBody: (createCode) => `Use this code to confirm your account: ${createCode()}`,
      userInvitation: {
        emailSubject: "Welcome to my app!",
        emailBody: (user, code) => `We're happy to have you! You can now login with username ${user()} and temporary password ${code()}`,
      },
      
    },
  },
  groups: ["admins"],

  access: (allow) => [
    allow.resource(addUserToGroup).to(["addUserToGroup"])
  ],
});
