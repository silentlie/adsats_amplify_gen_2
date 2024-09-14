import type { Schema } from "../../../resource";
import { env } from "$amplify/env/update-staff-subcategory-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { listStaffSubcategories } from "../../../graphql/queries";
import {
  createStaffSubcategory,
  deleteStaffSubcategory,
  updateStaffSubcategory,
} from "../../../graphql/mutations";

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

type Handler = Schema["updateStaffSubcategoryOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { compareKey, id, ids, accessLevels } = event.arguments;
  let promises: Promise<any>[] = [];
  const filter =
    compareKey === "STAFF"
      ? { subcategoryId: { eq: id } }
      : { staffId: { eq: id } };
  const staffSubcategoriesResult = await client.graphql({
    query: listStaffSubcategories,
    variables: {
      filter: filter,
    },
  });
  const oldRecords = staffSubcategoriesResult.data.listStaffSubcategories.items;
  const oldRecordsMap = new Map(
    oldRecords.map((oldRecord) => {
      return compareKey === "STAFF"
        ? [oldRecord.staffId, oldRecord]
        : [oldRecord.subcategoryId, oldRecord];
    }),
  );
  const newRecordsMap = new Map(
    ids.map((compareId, index) => [compareId, accessLevels[index]]),
  );
  newRecordsMap.forEach((accessLevel, compareId) => {
    const oldRecord = oldRecordsMap.get(compareId);
    if (oldRecord) {
      if (accessLevel === 0) {
        console.log(
          `Deleting old record with staffId: ${oldRecord.staffId} and subcategoryId: ${oldRecord.subcategoryId} (accessLevel 0)`,
        );
        promises.push(
          client.graphql({
            query: deleteStaffSubcategory,
            variables: {
              input: {
                staffId: oldRecord.staffId,
                subcategoryId: oldRecord.subcategoryId,
              },
            },
          }),
        );
      } else if (oldRecord.accessLevel !== accessLevel) {
        console.log(
          `Updating old record with staffId: ${oldRecord.staffId} and subcategoryId: ${oldRecord.subcategoryId}, new accessLevel: ${accessLevel}`,
        );
        promises.push(
          client.graphql({
            query: updateStaffSubcategory,
            variables: {
              input: {
                staffId: oldRecord.staffId,
                subcategoryId: oldRecord.subcategoryId,
                accessLevel: accessLevel,
              },
            },
          }),
        );
      }
      oldRecordsMap.delete(compareId);
    } else if (accessLevel !== 0) {
      console.log(
        `Creating new record with id: ${id} and compareId: ${compareId}, accessLevel: ${accessLevel}`,
      );
      promises.push(
        client.graphql({
          query: createStaffSubcategory,
          variables: {
            input:
              compareKey === "STAFF"
                ? {
                    staffId: compareId,
                    accessLevel: accessLevel,
                    subcategoryId: id,
                  }
                : {
                    subcategoryId: compareId,
                    accessLevel: accessLevel,
                    staffId: id,
                  },
          },
        }),
      );
    }
  });

  oldRecordsMap.forEach((oldRecord) => {
    console.log(
      `Deleting old record with staffId: ${oldRecord.staffId} and subcategoryId: ${oldRecord.subcategoryId} (not appear in new records)`,
    );
    promises.push(
      client.graphql({
        query: deleteStaffSubcategory,
        variables: {
          input: {
            staffId: oldRecord.staffId,
            subcategoryId: oldRecord.subcategoryId,
          },
        },
      }),
    );
  });

  const result = await Promise.all(promises);
  return result;
};
