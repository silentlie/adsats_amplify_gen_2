import type { Schema } from "../../resource";
// import { env } from "$amplify/env/delete-category-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  deleteCategory,
  deleteSubcategoryOverride,
} from "../../graphql/mutations";
import { listSubcategories } from "../../graphql/queries";

// Amplify.configure(
//   {
//     API: {
//       GraphQL: {
//         endpoint: env.AMPLIFY_DATA_GRAPHQL_ENDPOINT,
//         region: env.AWS_REGION,
//         defaultAuthMode: "iam",
//       },
//     },
//   },
//   {
//     Auth: {
//       credentialsProvider: {
//         getCredentialsAndIdentityId: async () => ({
//           credentials: {
//             accessKeyId: env.AWS_ACCESS_KEY_ID,
//             secretAccessKey: env.AWS_SECRET_ACCESS_KEY,
//             sessionToken: env.AWS_SESSION_TOKEN,
//           },
//         }),
//         clearCredentialsAndIdentityId: () => {
//           /* noop */
//         },
//       },
//     },
//   },
// );

type Handler = Schema["deleteCategoryOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { categoryId } = event.arguments;
  const promises: Promise<any>[] = [];
  const subcategoriesResult = await client.graphql({
    query: listSubcategories,
    variables: {
      filter: { categoryId: { eq: categoryId } },
    },
  });
  subcategoriesResult.data.listSubcategories.items.map((subcategory) =>
    promises.push(
      client.graphql({
        query: deleteSubcategoryOverride,
        variables: {
          subcategoryId: subcategory.id,
        },
      }),
    ),
  );
  promises.push(
    client.graphql({
      query: deleteCategory,
      variables: {
        input: {
          id: categoryId,
        },
      },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
