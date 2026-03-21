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
  const nowIso = new Date().toISOString();

  const { errors: listErrors, data: reminders } = await client.models.Reminder.list({
    filter: {
      date: {
        lt: nowIso,
      },
    },
    selectionSet: [
      "id",
      "date",
      "document.*",
      "staff.*",
      "staff.staff.id",
      "staff.staff.email",
      "staff.staff.firstName",
      "staff.staff.lastName",
    ],
  });
  if (listErrors) {
    console.error("Error listing reminders", listErrors);
    return;
  }

  const detailed = reminders.map((reminder) => ({
    id: reminder.id,
    date: reminder.date,
    document: reminder.document,
    recipients: reminder.staff?.map((join) => join.staff).filter(Boolean) ?? [],
  }));
  console.log("reminders", JSON.stringify(detailed, null, 2));
}