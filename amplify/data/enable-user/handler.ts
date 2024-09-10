import {
  CognitoIdentityProviderClient,
  AdminEnableUserCommand,
  AdminEnableUserCommandInput,
} from "@aws-sdk/client-cognito-identity-provider";
import type { Schema } from "../resource";
import { env } from "$amplify/env/enable-user";

type Handler = Schema["enableUser"]["functionHandler"];
const client = new CognitoIdentityProviderClient();

export const handler: Handler = async (event) => {
  const { id } = event.arguments;
  const input: AdminEnableUserCommandInput = {
    UserPoolId: "env.AMPLIFY_AUTH_USERPOOL_ID",
    Username: id,
  };
  const command = new AdminEnableUserCommand(input);
  const response = await client.send(command);
  return response;
};
