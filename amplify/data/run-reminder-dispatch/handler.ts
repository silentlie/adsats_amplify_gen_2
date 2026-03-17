import type { EventBridgeHandler } from "aws-lambda";
import { Amplify } from 'aws-amplify';
import { generateClient } from 'aws-amplify/data';
import { getAmplifyDataClientConfig } from '@aws-amplify/backend/function/runtime';
import { env } from '$amplify/env/run-reminder-dispatch';
import { Schema } from "../resource";

const { resourceConfig, libraryOptions } = await getAmplifyDataClientConfig(env);

Amplify.configure(resourceConfig, libraryOptions);

const client = generateClient<Schema>();

export const handler: EventBridgeHandler<"Scheduled Event", null, void> = async (event) => {
  const { errors: listErrors, data: reminders } = await client.models.Reminder.list();
  if (listErrors) {
    console.error("Error listing reminders", listErrors);
    return;
  }
  console.log("event", JSON.stringify(reminders, null, 2))
}