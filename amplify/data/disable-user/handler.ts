import {
  CognitoIdentityProviderClient,
  AdminDisableUserCommand,
  AdminDisableUserCommandInput,
} from "@aws-sdk/client-cognito-identity-provider";
import type { Schema } from "../resource";
import { env } from "$amplify/env/enable-user";

type Handler = Schema["disableUser"]["functionHandler"];
const client = new CognitoIdentityProviderClient();

export const handler: Handler = async (event) => {
  const { id } = event.arguments;
  const input: AdminDisableUserCommandInput = {
    UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID,
    Username: id,
  };
  const command = new AdminDisableUserCommand(input);
  const response = await client.send(command);
  return response;
};
