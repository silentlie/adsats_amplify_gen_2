import { defineStorage } from "@aws-amplify/backend";
import { deleteDocumentOverride } from "../data/override/delete/delete-document-override/resouce";
import { deleteNoticeDocumentOverride } from "../data/override/delete/delete-notice-document-override/resource";

export const storage = defineStorage({
  name: "adsatsS3",
  access: (allow) => ({
    "documents/*": [
      allow.authenticated.to(["read", "write", "delete"]),
      allow.resource(deleteDocumentOverride).to(["read", "write", "delete"]),
      allow.resource(deleteNoticeDocumentOverride).to(["read", "write", "delete"]),
    ],
  }),
});
