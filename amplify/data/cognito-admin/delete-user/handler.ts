import {
  CognitoIdentityProviderClient,
  AdminDeleteUserCommand,
  AdminDeleteUserCommandInput,
} from "@aws-sdk/client-cognito-identity-provider";
import type { Schema } from "../../resource";
import { env } from "$amplify/env/delete-user";

type Handler = Schema["deleteUser"]["functionHandler"];
const client = new CognitoIdentityProviderClient();

export const handler: Handler = async (event) => {
  const { id } = event.arguments;
  const input: AdminDeleteUserCommandInput = {
    UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID,
    Username: id,
  };
  const command = new AdminDeleteUserCommand(input);
  const response = await client.send(command);
  return response;
};
