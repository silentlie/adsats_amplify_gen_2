import type { Schema } from "../../../resource";
import { env } from "$amplify/env/create-staff-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  createAircraftStaff,
  createRoleStaff,
  createStaff,
  createStaffSubcategory,
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

type Handler = Schema["createStaffOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const {
    name,
    email,
    archived,
    aircraft,
    roles,
    subcategories,
    accessLevels,
  } = event.arguments;
  const promises: Promise<any>[] = [];
  console.log(`create Staff with email: ${email}`);
  const staffResult = await client.graphql({
    query: createStaff,
    variables: {
      input: {
        name: name,
        email: email,
        archived: archived,
      },
    },
  });
  const staffId = staffResult.data.createStaff.id;
  aircraft?.forEach((aircraftId) => {
    console.log(`create AircraftStaff with aircraftId: ${aircraftId}`);
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
  roles?.forEach((roleId) => {
    console.log(`create AircraftStaff with aircraftId: ${roleId}`);
    promises.push(
      client.graphql({
        query: createRoleStaff,
        variables: {
          input: {
            roleId: roleId,
            staffId: staffId,
          },
        },
      }),
    );
  });
  const staffSubcategories = combineLists(subcategories, accessLevels);
  staffSubcategories?.forEach(
    (accessLevel, subcategoryId) => {
      console.log(
        `create StaffSubcategory with subcategoryId: ${subcategoryId}`,
      );
      promises.push(
        client.graphql({
          query: createStaffSubcategory,
          variables: {
            input: {
              subcategoryId: subcategoryId,
              staffId: staffId,
              accessLevel: accessLevel
            },
          },
        }),
      );
    }
  )
  await Promise.all(promises);
  return staffResult;
};

function assert(condition: boolean, message: string): void {
  if (!condition) {
    throw new Error(message);
  }
}

function combineLists<K, V>(
  firstList: K[] | null | undefined,
  secondList: V[] | null | undefined,
): null | Map<K, V> {
  if (firstList == null && secondList == null) {
    return null;
  }
  assert(
    firstList?.length === secondList?.length,
    "Either both lists should be null, or both should have the same length.",
  );
  const map = new Map<K, V>();
  for (let i = 0; i < firstList!.length; i++) {
    map.set(firstList![i], secondList![i]);
  }
  return map;
};