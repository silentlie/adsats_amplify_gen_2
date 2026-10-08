import { generateClient } from "aws-amplify/data";
import { getAmplifyDataClientConfig } from "@aws-amplify/backend/function/runtime";
import type { Schema } from "../resource";
import { env } from "$amplify/env/send-notification-email";
import { configureIamDataClient } from "../configure-iam-data-client";

const { resourceConfig, libraryOptions } =
  await getAmplifyDataClientConfig(env);

configureIamDataClient(resourceConfig, libraryOptions);

export const client = generateClient<Schema>({ authMode: "iam" });
