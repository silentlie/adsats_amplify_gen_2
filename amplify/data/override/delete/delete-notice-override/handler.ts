import type { Schema } from "../../../resource";
import { env } from "$amplify/env/delete-notice-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  listAircraftNotices,
  listNoticeDocuments,
  listNoticeStaffs,
} from "../../../graphql/queries";
import {
  deleteAircraftNotice,
  deleteNotice,
  deleteNoticeDocumentOverride,
  deleteNoticeStaff,
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

type Handler = Schema["deleteNoticeOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { noticeId } = event.arguments;
  const promises: Promise<any>[] = [];
  const [noticeDocumentsResult, noticeStaffsResult, aircraftNoticesResult] =
    await Promise.all([
      client.graphql({
        query: listNoticeDocuments,
        variables: { filter: { noticeId: { eq: noticeId } } },
      }),
      client.graphql({
        query: listNoticeStaffs,
        variables: { filter: { noticeId: { eq: noticeId } } },
      }),
      client.graphql({
        query: listAircraftNotices,
        variables: { filter: { noticeId: { eq: noticeId } } },
      }),
    ]);
  noticeDocumentsResult.data.listNoticeDocuments.items.forEach(
    (noticeDocument) => {
      console.log(
        `Deleting noticeDocument: ${noticeDocument.id}/${noticeDocument.name}`,
      );
      promises.push(
        client.graphql({
          query: deleteNoticeDocumentOverride,
          variables: {
            noticeDocumentId: noticeDocument.id,
            noticeDocumentName: noticeDocument.name,
          },
        }),
      );
    },
  );
  noticeStaffsResult.data.listNoticeStaffs.items.forEach((noticeStaff) => {
    console.log(
      `Deleting NoticeStaff with staffId: ${noticeStaff.staffId}, noticeId: ${noticeStaff.noticeId}`,
    );
    promises.push(
      client.graphql({
        query: deleteNoticeStaff,
        variables: {
          input: {
            // staffId: noticeStaff.staffId,
            // noticeId: noticeStaff.noticeId,
            id: noticeStaff.id,
          },
        },
      }),
    );
  });
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
              // aircraftId: aircraftNotice.aircraftId,
              // noticeId: aircraftNotice.noticeId,
              id: aircraftNotice.id,
            },
          },
        }),
      );
    },
  );
  console.log(`Deleting notice with id: ${noticeId}`);
  promises.push(
    client.graphql({
      query: deleteNotice,
      variables: { input: { id: noticeId } },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
