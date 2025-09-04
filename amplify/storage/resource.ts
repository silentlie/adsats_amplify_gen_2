import { defineStorage } from "@aws-amplify/backend";

export const storage = defineStorage({
  name: "adsatsS3",
  access: (allow) => ({
    "documents/*": [
      allow.authenticated.to(["read", "write", "delete"]),
    ],
    "flightCrewRecords/*": [
      allow.authenticated.to(["read", "write", "delete"]),
    ],
    "noticeDocuments/*": [
      allow.authenticated.to(["read", "write", "delete"]),
    ],
    "delete": [
      allow.authenticated.to(["write"]),
    ]
  }),
});
