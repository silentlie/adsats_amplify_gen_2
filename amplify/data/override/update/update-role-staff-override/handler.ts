import type { Schema } from "../../../resource";
import { env } from "$amplify/env/update-role-staff-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { listRoleStaffs } from "../../../graphql/queries";
import { createRoleStaff, deleteRoleStaff } from "../../../graphql/mutations";

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

type Handler = Schema["updateRoleStaffOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { compareKey, id, ids } = event.arguments;
  const promises: Promise<any>[] = [];
  const filter =
    compareKey === "STAFF" ? { roleId: { eq: id } } : { staffId: { eq: id } };
  const roleStaffsResult = await client.graphql({
    query: listRoleStaffs,
    variables: {
      filter: filter,
    },
  });
  const oldRecords = roleStaffsResult.data.listRoleStaffs.items;
  const oldIds = new Set(
    oldRecords.map((oldRecord) =>
      compareKey === "STAFF" ? oldRecord.staffId : oldRecord.roleId,
    ),
  );
  const newIds = new Set(ids);

  newIds.forEach((compareId) => {
    if (!oldIds.has(compareId)) {
      console.log(
        `Creating new record with id: ${id} and compareId: ${compareId}`,
      );
      promises.push(
        client.graphql({
          query: createRoleStaff,
          variables: {
            input:
              compareKey === "STAFF"
                ? { staffId: compareId, roleId: id }
                : { roleId: compareId, staffId: id },
          },
        }),
      );
    }
  });

  oldRecords.forEach((oldRecord) => {
    const compareId =
      compareKey === "STAFF" ? oldRecord.staffId : oldRecord.roleId;
    if (!newIds.has(compareId)) {
      console.log(
        `Deleting old record with staffId: ${oldRecord.staffId} and roleId: ${oldRecord.roleId}`,
      );
      promises.push(
        client.graphql({
          query: deleteRoleStaff,
          variables: {
            input: { staffId: oldRecord.staffId, roleId: oldRecord.roleId },
          },
        }),
      );
    }
  });
  const result = await Promise.all(promises);
  return result;
};
