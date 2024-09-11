import { defineStorage } from "@aws-amplify/backend";
import { deleteDocumentOverride } from "../data/override/delete-document-override/resouce";

export const storage = defineStorage({
  name: "adsatsS3",
  access: (allow) => ({
    "documents/*": [
      allow.authenticated.to(["read", "write", "delete"]),
      allow.resource(deleteDocumentOverride).to(["read", "write", "delete"]),
    ],
  }),
});
