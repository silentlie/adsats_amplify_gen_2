import type { Schema } from "../resource";
import { env } from "$amplify/env/list-users";
import {
  ListUsersCommand,
  ListUsersCommandInput,
  CognitoIdentityProviderClient,
} from "@aws-sdk/client-cognito-identity-provider";

type Handler = Schema["listUsers"]["functionHandler"];
const client = new CognitoIdentityProviderClient();

export const handler: Handler = async (event) => {
  const { attributesToGet, limit, paginationToken, filter } = event.arguments;
  const input: ListUsersCommandInput = {
    UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID,
    AttributesToGet: attributesToGet ?? undefined,
    Limit: limit ?? undefined,
    PaginationToken: paginationToken ?? undefined,
    Filter: filter ?? undefined,
  };
  const command = new ListUsersCommand(input);
  const response = await client.send(command);
  return response;
};
