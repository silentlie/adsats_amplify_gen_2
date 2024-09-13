import type { Schema } from "../../../resource";
import { env } from "$amplify/env/create-notice-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  createAircraftNotice,
  createNotice,
  createNoticeDocument,
  createNoticeStaff,
} from "../../../graphql/mutations";
import { NoticeStatus, NoticeType } from "../../../graphql/API";

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

type Handler = Schema["createNoticeOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const {
    subject,
    type,
    status,
    archived,
    details,
    noticed_at,
    deadline_at,
    staffId,
    recipients,
    aircraft,
    documents,
  } = event.arguments;
  const promises: Promise<any>[] = [];
  console.log(`create notice with subject: ${subject}`);
  const noticeResult = await client.graphql({
    query: createNotice,
    variables: {
      input: {
        subject: subject,
        type: type as NoticeType,
        status: status as NoticeStatus,
        archived: archived,
        details: JSON.stringify(details),
        noticed_at: noticed_at,
        deadline_at: deadline_at,
        staffId: staffId,
      },
    },
  });
  const noticeId = noticeResult.data.createNotice.id;
  recipients?.forEach((staffId) => {
    console.log(`create NoticeStaff with staffId: ${staffId}`);
    promises.push(
      client.graphql({
        query: createNoticeStaff,
        variables: {
          input: {
            noticeId: noticeId,
            staffId: staffId,
          },
        },
      }),
    );
  });
  aircraft?.forEach((aircraftId) => {
    console.log(`create AircraftNotice with aircraftId: ${aircraftId}`);
    promises.push(
      client.graphql({
        query: createAircraftNotice,
        variables: {
          input: {
            noticeId: noticeId,
            aircraftId: aircraftId,
          },
        },
      }),
    );
  });
  documents?.forEach((documentName) => {
    console.log(`create NoticeDocument with name: ${documentName}`);
    promises.push(
      client.graphql({
        query: createNoticeDocument,
        variables: {
          input: {
            noticeId: noticeId,
            name: documentName,
          },
        },
      }),
    );
  });
  await Promise.all(promises);
  return noticeResult;
};
