import type { EventBridgeHandler } from "aws-lambda";
import { client } from "./amplifyClient";
import { buildReminderEmail } from "./emailTemplate";
import { sendEmail } from "./emailSender";
import { deleteReminderCascade } from "./reminderCleanup";

export const handler: EventBridgeHandler<
  "Scheduled Event",
  null,
  void
> = async () => {
  const nowIso = new Date().toISOString();

  const { errors: listErrors, data: reminders } =
    await client.models.Reminder.list({
      filter: {
        date: {
          lt: nowIso,
        },
      },
      selectionSet: [
        "id",
        "date",
        "document.id",
        "document.name",
        "document.expiredAt",
        "document.subcategory.id",
        "document.subcategory.name",
        "document.subcategory.category.id",
        "document.subcategory.category.name",
        "staff.*",
        "staff.staff.id",
        "staff.staff.email",
        "staff.staff.firstName",
        "staff.staff.lastName",
      ],
    });

  if (listErrors && listErrors.length > 0) {
    console.error("Error listing reminders", listErrors);
    return;
  }

  const reminderResults = await Promise.allSettled(
    reminders.map(async (reminder) => {
      if (!reminder.document?.expiredAt) {
        console.error(
          `Reminder ${reminder.id} skipped: document is missing expiredAt`,
        );
        return;
      }

      const recipients = reminder.staff.map((recipient) => recipient.staff);

      if (recipients.length === 0) {
        console.error(
          `Reminder ${reminder.id} skipped: no recipients with email`,
        );
        return;
      }

      const documentTitle = reminder.document.name;
      const categoryName = reminder.document.subcategory.category.name;
      const subcategoryName = reminder.document.subcategory.name;

      const sendResults = await Promise.allSettled(
        recipients.map(async (person) => {
          const { html, expiryDate } = buildReminderEmail({
            firstName: person.firstName,
            lastName: person.lastName,
            documentTitle,
            categoryName,
            subcategoryName,
            expiredAt: reminder.document.expiredAt!,
            reminderId: reminder.id,
          });

          await sendEmail({
            subject: `Reminder: ${documentTitle} expires ${expiryDate}`,
            htmlBody: html,
            recipients: [person.email!],
          });

          console.log(`Reminder ${reminder.id} sent to ${person.email}`);
        }),
      );

      const failedSends = sendResults.filter(
        (result) => result.status === "rejected",
      );

      if (failedSends.length === sendResults.length) {
        console.error(
          `Reminder ${reminder.id} not deleted because all email(s) failed`,
          failedSends,
        );
        return;
      }

      await deleteReminderCascade(reminder.id);
      const successCount = sendResults.length - failedSends.length;
      if (failedSends.length > 0) {
        console.error(
          `Reminder ${reminder.id} deleted after partial send success: ${successCount} succeeded, ${failedSends.length} failed`,
          failedSends,
        );
      } else {
        console.log(
          `Reminder ${reminder.id} deleted after ${successCount} successful email(s)`,
        );
      }
    }),
  );

  const failedReminders = reminderResults.filter(
    (result) => result.status === "rejected",
  );

  if (failedReminders.length > 0) {
    console.error("Some reminders failed to process", failedReminders);
  }
};
