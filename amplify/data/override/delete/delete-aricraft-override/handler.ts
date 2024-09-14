import type { Schema } from "../../../resource";
import { env } from "$amplify/env/delete-aircraft-override";
import { generateClient, GraphQLResult } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  deleteAircraft,
  deleteAircraftDocument,
  deleteAircraftNotice,
  deleteAircraftStaff,
} from "../../../graphql/mutations";
import {
  listAircraftDocuments,
  listAircraftNotices,
  listAircraftStaffs,
} from "../../../graphql/queries";

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

type Handler = Schema["deleteAircraftOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { aircraftId } = event.arguments;
  const promises: Promise<GraphQLResult<any>>[] = [];
  const [aircraftNoticesResult, aircraftDocumentsResult, aircraftStaffsResult] =
    await Promise.all([
      client.graphql({
        query: listAircraftNotices,
        variables: { filter: { aircraftId: { eq: aircraftId } } },
      }),
      client.graphql({
        query: listAircraftDocuments,
        variables: { filter: { aircraftId: { eq: aircraftId } } },
      }),
      client.graphql({
        query: listAircraftStaffs,
        variables: { filter: { aircraftId: { eq: aircraftId } } },
      }),
    ]);
  aircraftNoticesResult.data.listAircraftNotices.items.forEach(
    (aircraftNotice) => {
      console.log(
        `Deleting AircraftNotice with aircraftId: ${aircraftNotice.aircraftId}, noticeId: ${aircraftNotice.noticeId}`,
      );
      promises.push(
        client.graphql({
          query: deleteAircraftNotice,
          variables: {
            input: {
              aircraftId: aircraftNotice.aircraftId,
              noticeId: aircraftNotice.noticeId,
            },
          },
        }),
      );
    },
  );
  aircraftDocumentsResult.data.listAircraftDocuments.items.forEach(
    (aircraftDocument) => {
      console.log(
        `Deleting AircraftDocument with aircraftId: ${aircraftDocument.aircraftId}, documentId: ${aircraftDocument.documentId}`,
      );
      promises.push(
        client.graphql({
          query: deleteAircraftDocument,
          variables: {
            input: {
              aircraftId: aircraftDocument.aircraftId,
              documentId: aircraftDocument.documentId,
            },
          },
        }),
      );
    },
  );
  aircraftStaffsResult.data.listAircraftStaffs.items.forEach(
    (aircraftStaff) => {
      console.log(
        `Deleting AircraftStaff with aircraftId: ${aircraftStaff.aircraftId}, staffId: ${aircraftStaff.staffId}`,
      );
      promises.push(
        client.graphql({
          query: deleteAircraftStaff,
          variables: {
            input: {
              aircraftId: aircraftStaff.aircraftId,
              staffId: aircraftStaff.staffId,
            },
          },
        }),
      );
    },
  );
  console.log(`Deleting aircraft with id: ${aircraftId}`);
  promises.push(
    client.graphql({
      query: deleteAircraft,
      variables: { input: { id: aircraftId } },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
