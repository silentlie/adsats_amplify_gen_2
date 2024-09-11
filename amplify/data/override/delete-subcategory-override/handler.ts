import type { Schema } from "../../resource";
import { env } from "$amplify/env/delete-subcategory-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  deleteStaffSubcategory,
  deleteSubcategory,
} from "../../graphql/mutations";
import { listStaffSubcategories } from "../../graphql/queries";
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

type Handler = Schema["deleteSubcategoryOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { subcategoryId } = event.arguments;
  const promises: Promise<any>[] = [];
  const staffSubcategoriesResult = await client.graphql({
    query: listStaffSubcategories,
    variables: {
      filter: {
        subcategoryId: { eq: subcategoryId },
      },
    },
  });
  staffSubcategoriesResult.data.listStaffSubcategories.items.map(
    (staffSubcategory) =>
      promises.push(
        client.graphql({
          query: deleteStaffSubcategory,
          variables: {
            input: { id: staffSubcategory.id },
          },
        }),
      ),
  );
  promises.push(
    client.graphql({
      query: deleteSubcategory,
      variables: {
        input: {
          id: subcategoryId,
        },
      },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
