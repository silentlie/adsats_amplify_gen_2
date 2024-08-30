import { defineStorage } from "@aws-amplify/backend";

export const storage = defineStorage({
  name: "adsatsS3",
  access: (allow) => ({
    "documents/*": [allow.authenticated.to(["read", "write", "delete"])],
  }),
});
