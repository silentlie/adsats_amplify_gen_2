import type { Schema } from "../resource";
import { env } from "$amplify/env/delete-category-lambda";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import { deleteCategory, deleteSubcategory } from "../graphql/mutations";
import { listSubcategories } from "../graphql/queries";

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

type Handler = Schema["deleteCategoryLambda"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { categoryId } = event.arguments;
  const subcategoriesResult = await client.graphql({
    query: listSubcategories,
    variables: {
      filter: { categoryId: { eq: categoryId } },
    },
  });
  const subcategories = subcategoriesResult.data.listSubcategories.items || [];
  const deleteSubcategoryPromises = subcategories.map((subcategory) =>
    client.graphql({
      query: deleteSubcategory,
      variables: {
        input: {
          id: subcategory.id,
        },
      },
    }),
  );
  await Promise.all(deleteSubcategoryPromises);
  const deleteResult = await client.graphql({
    query: deleteCategory,
    variables: {
      input: {
        id: categoryId,
      },
    },
  });
  return deleteResult;
};
