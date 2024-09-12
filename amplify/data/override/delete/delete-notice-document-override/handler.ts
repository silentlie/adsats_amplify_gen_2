import type { Schema } from "../../../resource";
import { env } from "$amplify/env/delete-notice-document-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { remove } from "aws-amplify/storage";
import { deleteNoticeDocument } from "../../../graphql/mutations";

Amplify.configure(
  {
    API: {
      GraphQL: {
        endpoint: env.AMPLIFY_DATA_GRAPHQL_ENDPOINT,
        region: env.AWS_REGION,
        defaultAuthMode: "iam",
      },
    },
    storage: {
      aws_region: env.AWS_REGION,
      bucket_name: env.ADSATS_S_3_BUCKET_NAME,
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

type Handler = Schema["deleteNoticeDocumentOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { noticeDocumentId, noticeDocumentName } = event.arguments;
  const promises: Promise<any>[] = [];
  console.log(
    `Deleting noticeDocument in s3: ${noticeDocumentId}/${noticeDocumentName}`,
  );
  promises.push(
    remove({
      path: `noticeDocuments/${noticeDocumentId}/${noticeDocumentName}`,
    }),
  );
  console.log(`Deleting noticeDocument with id: ${noticeDocumentId}`);
  promises.push(
    client.graphql({
      query: deleteNoticeDocument,
      variables: { input: { id: noticeDocumentId } },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
