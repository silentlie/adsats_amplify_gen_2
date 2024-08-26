import { type ClientSchema, a, defineData } from "@aws-amplify/backend";
import { listUsers } from "./list-users/resource";

const schema = a.schema({
  listUsers: a
    .query()
    .arguments({
      attributesToGet: a.string().required().array(),
      limit: a.integer(),
      paginationToken: a.string(),
      filter: a.string(),
    })
    .authorization((allow) => [allow.authenticated()])
    .handler(a.handler.function(listUsers))
    .returns(a.json()),
  Todo: a
    .model({
      content: a.string(),
    })
    .authorization((allow) => [allow.guest()]),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: "userPool",
  },
});
