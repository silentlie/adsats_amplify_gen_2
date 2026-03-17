import { defineFunction } from "@aws-amplify/backend";

export const runReminderDispatch = defineFunction({
  name: "run-reminder-dispatch",
  schedule: "every 5m"
})