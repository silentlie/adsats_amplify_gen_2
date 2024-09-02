import {
  CognitoIdentityProviderClient,
  AdminCreateUserCommand,
  AdminCreateUserCommandInput,
} from "@aws-sdk/client-cognito-identity-provider";
import type { Schema } from "../resource";
import { env } from "$amplify/env/create-user";

type Handler = Schema["createUser"]["functionHandler"];
const client = new CognitoIdentityProviderClient();

export const handler: Handler = async (event) => {
  const { email, name, temporaryPassword } = event.arguments;
  const input: AdminCreateUserCommandInput = {
    UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID,
    Username: email,
    UserAttributes: [
      {
        Name: "name",
        Value: name,
      },
    ],
    DesiredDeliveryMediums: ["EMAIL"],
    // MessageAction: "RESEND",
    TemporaryPassword: temporaryPassword,
    ForceAliasCreation: false,
  };
  const command = new AdminCreateUserCommand(input);
  const response = await client.send(command);
  return response;
};
