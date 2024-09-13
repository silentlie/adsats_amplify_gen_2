import type { Schema } from "../../../resource";
import { env } from "$amplify/env/create-subcategory-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  createStaffSubcategory,
  createSubcategory,
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

type Handler = Schema["createSubcategoryOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { categoryId, name, description, archived, staff, accessLevels } =
    event.arguments;
  const promises: Promise<any>[] = [];
  console.log(`create subcategory with name: ${name}`);
  const subcategoryResult = await client.graphql({
    query: createSubcategory,
    variables: {
      input: {
        categoryId: categoryId,
        name: name,
        description: description,
        archived: archived,
      },
    },
  });
  const subcategoryId = subcategoryResult.data.createSubcategory.id;
  const staffSubcategories = combineLists(staff, accessLevels);
  staffSubcategories?.forEach((accessLevel, staffId) => {
    console.log(`create StaffSubcategory with staffId: ${staffId}`);
    promises.push(
      client.graphql({
        query: createStaffSubcategory,
        variables: {
          input: {
            subcategoryId: subcategoryId,
            staffId: staffId,
            accessLevel: accessLevel,
          },
        },
      }),
    );
  });
  await Promise.all(promises);
  return subcategoryResult;
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
}
