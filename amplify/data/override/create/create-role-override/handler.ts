import type { Schema } from "../../../resource";
import { env } from "$amplify/env/create-role-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { createRole, createRoleStaff } from "../../../graphql/mutations";
Amplify.configure(
  {
    API: {
      GraphQL: {
        endpoint: env.AMPLIFY_DATA_GRAPHQL_ENDPOINT,
        region: env.AWS_REGION,
        defaultAuthMode: "iam",
      },
    },
  },
  {
    Auth: {
      credentialsProvider: {
        getCredentialsAndIdentityId: async () => ({
          credentials: {
            accessKeyId: env.AWS_ACCESS_KEY_ID,
            secretAccessKey: env.AWS_SECRET_ACCESS_KEY,
            sessionToken: env.AWS_SESSION_TOKEN,
          },
        }),
        clearCredentialsAndIdentityId: () => {
          /* noop */
        },
      },
    },
  },
);

type Handler = Schema["createRoleOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { name, description, archived, staff } = event.arguments;
  const promises: Promise<any>[] = [];
  console.log(`create role with name: ${name}`);
  const roleResult = await client.graphql({
    query: createRole,
    variables: {
      input: {
        name: name,
        description: description,
        archived: archived,
      },
    },
  });
  const roleId = roleResult.data.createRole.id;
  staff?.forEach((staffId) => {
    console.log(`create RoleStaff with staffId: ${staffId}`);
    promises.push(
      client.graphql({
        query: createRoleStaff,
        variables: {
          input: {
            roleId: roleId,
            staffId: staffId,
          },
        },
      }),
    );
  });
  await Promise.all(promises);
  return roleResult;
};
