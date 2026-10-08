import { generateClient } from "aws-amplify/data";
import { getAmplifyDataClientConfig } from "@aws-amplify/backend/function/runtime";
import { env } from "$amplify/env/run-reminder-dispatch";
import type { Schema } from "../resource";
import { configureIamDataClient } from "../configure-iam-data-client";

const { resourceConfig, libraryOptions } =
  await getAmplifyDataClientConfig(env);

configureIamDataClient(resourceConfig, libraryOptions);

export const client = generateClient<Schema>({ authMode: "iam" });
