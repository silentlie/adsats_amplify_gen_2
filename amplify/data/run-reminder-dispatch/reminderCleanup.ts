import { client } from "./amplifyClient";

export async function deleteReminderCascade(id: string) {
  const { errors: getErrors, data: reminder } =
    await client.models.Reminder.get(
      { id },
      {
        selectionSet: ["id", "staff.reminderId", "staff.staffId"],
      },
    );

  if (getErrors && getErrors.length > 0) {
    throw new Error(
      `Error fetching reminder ${id}: ${JSON.stringify(getErrors)}`,
    );
  }

  if (!reminder) {
    console.warn(`Reminder ${id} not found during cascade delete, skipping`);
    return;
  }

  const staffAssociations = reminder.staff;

  const deleteResults = await Promise.allSettled(
    staffAssociations.map((assoc) =>
      client.models.ReminderStaff.delete({
        reminderId: assoc.reminderId,
        staffId: assoc.staffId,
      }),
    ),
  );

  const failedDeletes = deleteResults.filter((result) => {
    if (result.status === "rejected") return true;
    return result.value.errors && result.value.errors.length > 0;
  });

  if (failedDeletes.length > 0) {
    throw new Error(
      `Failed deleting ReminderStaff for reminder ${id}: ${JSON.stringify(failedDeletes)}`,
    );
  }

  const { errors: deleteErrors } = await client.models.Reminder.delete({ id });

  if (deleteErrors && deleteErrors.length > 0) {
    throw new Error(
      `Error deleting reminder ${id}: ${JSON.stringify(deleteErrors)}`,
    );
  }
}
