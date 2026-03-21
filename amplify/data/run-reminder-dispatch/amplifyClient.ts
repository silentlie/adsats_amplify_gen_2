import { Amplify } from "aws-amplify";
import { generateClient } from "aws-amplify/data";
import { getAmplifyDataClientConfig } from "@aws-amplify/backend/function/runtime";
import { env } from "$amplify/env/run-reminder-dispatch";
import { Schema } from "../resource";

const { resourceConfig, libraryOptions } =
  await getAmplifyDataClientConfig(env);

Amplify.configure(resourceConfig, libraryOptions);

export const client = generateClient<Schema>();
