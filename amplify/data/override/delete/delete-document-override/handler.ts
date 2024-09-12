import type { Schema } from "../../../resource";
import { env } from "$amplify/env/delete-document-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { remove } from "aws-amplify/storage";
import {
  deleteDocument,
  deleteAircraftDocument,
} from "../../../graphql/mutations";
import { listAircraftDocuments } from "../../../graphql/queries";

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

type Handler = Schema["deleteDocumentOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { documentId, documentName } = event.arguments;
  const promises: Promise<any>[] = [];
  const aircraftDocumentsResult = await client.graphql({
    query: listAircraftDocuments,
    variables: { filter: { documentId: { eq: documentId } } },
  });
  aircraftDocumentsResult.data.listAircraftDocuments.items.forEach(
    (aircraftDocument) => {
      console.log(`Deleting AircraftDocument with id: ${aircraftDocument.id}`);
      promises.push(
        client.graphql({
          query: deleteAircraftDocument,
          variables: { input: { id: aircraftDocument.id } },
        }),
      );
    },
  );
  console.log(`Deleting document in s3: ${documentId}/${documentName}`);
  promises.push(
    remove({
      path: `documents/${documentId}/${documentName}`,
    }),
  );
  console.log(`Deleting document with id: ${documentId}`);
  promises.push(
    client.graphql({
      query: deleteDocument,
      variables: { input: { id: documentId } },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
