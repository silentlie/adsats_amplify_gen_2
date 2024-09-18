import type { Schema } from "../../../resource";
import { env } from "$amplify/env/update-aircraft-notice-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { listAircraftNotices } from "../../../graphql/queries";
import { createAircraftNotice, deleteAircraftNotice } from "../../../graphql/mutations";

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

type Handler = Schema["updateAircraftNoticeOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  // const { compareKey, id, ids } = event.arguments;
  // const promises: Promise<any>[] = [];
  // const filter =
  //   compareKey === "NOTICE"
  //     ? { aircraftId: { eq: id } }
  //     : { noticeId: { eq: id } };
  // const aircraftNoticesResult = await client.graphql({
  //   query: listAircraftNotices,
  //   variables: {
  //     filter: filter,
  //   },
  // });
  // const oldRecords = aircraftNoticesResult.data.listAircraftNotices.items;
  // const oldIds = new Set(
  //   oldRecords.map((oldRecord) =>
  //     compareKey === "NOTICE" ? oldRecord.noticeId : oldRecord.aircraftId,
  //   ),
  // );
  // const newIds = new Set(ids);

  // newIds.forEach((compareId) => {
  //   if (!oldIds.has(compareId)) {
  //     console.log(
  //       `Creating new record with id: ${id} and compareId: ${compareId}`,
  //     );
  //     promises.push(
  //       client.graphql({
  //         query: createAircraftNotice,
  //         variables: {
  //           input:
  //             compareKey === "NOTICE"
  //               ? { noticeId: compareId, aircraftId: id }
  //               : { aircraftId: compareId, noticeId: id },
  //         },
  //       }),
  //     );
  //   }
  // });
  // oldRecords.forEach((oldRecord) => {
  //   const compareId =
  //     compareKey === "NOTICE" ? oldRecord.noticeId : oldRecord.aircraftId;
  //   if (!newIds.has(compareId)) {
  //     console.log(
  //       `Deleting old record with noticeId: ${oldRecord.noticeId} and aircraftId: ${oldRecord.aircraftId}`,
  //     );
  //     promises.push(
  //       client.graphql({
  //         query: deleteAircraftNotice,
  //         variables: {
  //           input: {
  //             noticeId: oldRecord.noticeId,
  //             aircraftId: oldRecord.aircraftId,
  //           },
  //         },
  //       }),
  //     );
  //   }
  // });
  // const result = await Promise.all(promises);
  return {};
};