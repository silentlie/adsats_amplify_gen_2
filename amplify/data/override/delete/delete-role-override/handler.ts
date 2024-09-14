import type { Schema } from "../../../resource";
import { env } from "$amplify/env/delete-role-override";
import { generateClient, GraphQLResult } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { deleteRole, deleteRoleStaff } from "../../../graphql/mutations";
import { listRoleStaffs } from "../../../graphql/queries";

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

type Handler = Schema["deleteRoleOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { roleId } = event.arguments;
  const promises: Promise<GraphQLResult<any>>[] = [];
  const roleStaffsResult = await client.graphql({
    query: listRoleStaffs,
    variables: { filter: { roleId: { eq: roleId } } },
  });
  roleStaffsResult.data.listRoleStaffs.items.forEach((roleStaff) => {
    console.log(
      `Deleting RoleStaff with staffId: ${roleStaff.staffId}, roleId: ${roleStaff.roleId}`,
    );
    promises.push(
      client.graphql({
        query: deleteRoleStaff,
        variables: {
          input: {
            staffId: roleStaff.staffId,
            roleId: roleStaff.roleId,
          },
        },
      }),
    );
  });
  console.log(`Deleting role with id: ${roleId}`);
  promises.push(
    client.graphql({
      query: deleteRole,
      variables: { input: { id: roleId } },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
