import type { Schema } from "../../../resource";
import { env } from "$amplify/env/create-document-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  createAircraftDocument,
  createDocument,
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

type Handler = Schema["createDocumentOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { name, staffId, subcategoryId, archived, aircraft } = event.arguments;
  const promises: Promise<any>[] = [];
  console.log(`create document with name: ${name}`);
  const documentResult = await client.graphql({
    query: createDocument,
    variables: {
      input: {
        name: name,
        archived: archived,
        staffId: staffId,
        subcategoryId: subcategoryId,
      },
    },
  });
  const documentId = documentResult.data.createDocument.id;
  aircraft?.forEach((aircraftId) => {
    console.log(`create AircraftDocument with documentId: ${documentId}`);
    promises.push(
      client.graphql({
        query: createAircraftDocument,
        variables: {
          input: {
            aircraftId: aircraftId,
            documentId: documentId,
          },
        },
      }),
    );
  });
  await Promise.all(promises);
  return documentResult;
};
