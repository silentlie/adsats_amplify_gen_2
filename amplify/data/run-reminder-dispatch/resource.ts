import { defineFunction } from "@aws-amplify/backend";

export const runReminderDispatch = defineFunction({
  name: "runReminderDispatch",
  schedule: "every 5m"
})