import type { Schema } from "../../../resource";
import { env } from "$amplify/env/create-aircraft-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  createAircraft,
  createAircraftStaff,
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

type Handler = Schema["createAircraftOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { name, description, archived, staff } = event.arguments;
  const promises: Promise<any>[] = [];
  console.log(`create aircraft with name: ${name}`);
  const aircraftResult = await client.graphql({
    query: createAircraft,
    variables: {
      input: {
        name: name,
        description: description,
        archived: archived,
      },
    },
  });
  const aircraftId = aircraftResult.data.createAircraft.id;
  staff?.forEach((staffId) => {
    console.log(`create AircraftStaff with staffId: ${staffId}`);
    promises.push(
      client.graphql({
        query: createAircraftStaff,
        variables: {
          input: {
            aircraftId: aircraftId,
            staffId: staffId,
          },
        },
      }),
    );
  });
  await Promise.all(promises);
  return aircraftResult;
};
