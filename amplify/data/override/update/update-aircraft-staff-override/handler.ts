import type { Schema } from "../../../resource";
import { env } from "$amplify/env/update-aircraft-staff-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { listAircraftStaffs } from "../../../graphql/queries";
import {
  createAircraftStaff,
  deleteAircraftStaff,
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

type Handler = Schema["updateAircraftStaffOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { compareKey, id, ids } = event.arguments;
  const promises: Promise<any>[] = [];
  const filter =
    compareKey === "STAFF"
      ? { aircraftId: { eq: id } }
      : { staffId: { eq: id } };
  const aircraftStaffsResult = await client.graphql({
    query: listAircraftStaffs,
    variables: {
      filter: filter,
    },
  });
  const oldRecords = aircraftStaffsResult.data.listAircraftStaffs.items;
  const oldIds = new Set(
    oldRecords.map((oldRecord) =>
      compareKey === "STAFF" ? oldRecord.staffId : oldRecord.aircraftId,
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
          query: createAircraftStaff,
          variables: {
            input:
              compareKey === "STAFF"
                ? { staffId: compareId, aircraftId: id }
                : { aircraftId: compareId, staffId: id },
          },
        }),
      );
    }
  });
  oldRecords.forEach((oldRecord) => {
    const compareId =
      compareKey === "STAFF" ? oldRecord.staffId : oldRecord.aircraftId;
    if (!newIds.has(compareId)) {
      console.log(
        `Deleting old record with staffId: ${oldRecord.staffId} and aircraftId: ${oldRecord.aircraftId}`,
      );
      promises.push(
        client.graphql({
          query: deleteAircraftStaff,
          variables: {
            input: {
              staffId: oldRecord.staffId,
              aircraftId: oldRecord.aircraftId,
            },
          },
        }),
      );
    }
  });
  const result = await Promise.all(promises);
  return result;
};
