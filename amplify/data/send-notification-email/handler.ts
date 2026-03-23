import { client } from "./amplifyClient";
import { renderNotificationEmail } from "./notificationTemplate";
import { sendEmail } from "./emailSender";
import type { Schema } from "../resource";

type Handler = Schema["sendNotificationEmail"]["functionHandler"];
type StaffLike = {
  readonly firstName: string;
  readonly lastName: string;
  readonly email: string;
};

type NotificationRecord = {
  id: string;
  subject: string;
  type?: string | null;
  status?: string | null;
  sender?: StaffLike | null;
  recipients: Array<{
    staff?: StaffLike | null;
  }>;
};

type SendEmailResult = {
  recipient: string;
  ok: boolean;
  error?: unknown;
};

export const handler: Handler = async (event) => {
  const { id, isNotice, isReport, host } = event.arguments;

  if (isNotice === isReport) {
    throw new Error(
      "Invalid arguments: exactly one of isNotice or isReport must be true",
    );
  }

  const now = new Date();
  const timeText = `${now.toLocaleDateString()} at ${now.toLocaleTimeString()}`;
  const timezoneText = Intl.DateTimeFormat().resolvedOptions().timeZone;

  if (isNotice) {
    const { data, errors } = await client.models.Notice.get(
      { id },
      {
        selectionSet: [
          "id",
          "subject",
          "type",
          "status",
          "author.*",
          "recipients.staff.*",
        ],
      },
    );

    if (errors?.length) {
      throw new Error(
        `Failed to get notice with id ${id}: ${JSON.stringify(errors)}`,
      );
    }
    if (!data) {
      throw new Error(`Notice with id ${id} not found`);
    }

    return sendNotifications({
      record: {
        id: data.id,
        subject: data.subject,
        type: data.type,
        status: data.status,
        sender: data.author,
        recipients: data.recipients,
      },
      host,
      timeText,
      timezoneText,
      entityLabel: "notice",
      reviewText: "Review the notification details",
      primaryAction: 'Click "Mark as read" to acknowledge receipt',
      secondaryAction: "Take necessary actions as required",
      ctaText: "Log onto ADSATS here to view notice",
      linkPath: `/sms/${id}`,
    });
  }

  const { data, errors } = await client.models.Report.get(
    { id },
    {
      selectionSet: [
        "id",
        "subject",
        "archived",
        "type",
        "status",
        "details",
        "auditor.*",
        "recipients.staff.*",
      ],
    },
  );

  if (errors?.length) {
    throw new Error(
      `Failed to get report with id ${id}: ${JSON.stringify(errors)}`,
    );
  }
  if (!data) {
    throw new Error(`Report with id ${id} not found`);
  }

  return sendNotifications({
    record: {
      id: data.id,
      subject: data.subject,
      type: data.type,
      status: data.status,
      sender: data.auditor,
      recipients: data.recipients,
    },
    host,
    timeText,
    timezoneText,
    entityLabel: "audit report",
    reviewText: "Review the audit findings",
    primaryAction: 'Click "Mark as read" after reviewing the document',
    secondaryAction: "Complete any required follow-up actions",
    ctaText: "Log onto ADSATS here to view report",
    linkPath: `/cms/${id}`,
  });
};

async function sendNotifications({
  record,
  host,
  timeText,
  timezoneText,
  entityLabel,
  reviewText,
  primaryAction,
  secondaryAction,
  ctaText,
  linkPath,
}: {
  record: NotificationRecord;
  host: string;
  timeText: string;
  timezoneText: string;
  entityLabel: string;
  reviewText: string;
  primaryAction: string;
  secondaryAction: string;
  ctaText: string;
  linkPath: string;
}): Promise<SendEmailResult[]> {
  const authorName = getDisplayName(record.sender) || "ADSATS Team";
  const notificationType = toDisplayType(record.type) || "N/A";
  const status = toDisplayType(record.status) || "N/A";
  const cleanSubject = record.subject.trim() || "Untitled";
  const emailSubject = `${notificationType}: ${cleanSubject} [${status}]`;
  const link = `${host}${linkPath}`;

  const recipients = record.recipients.map((recipient) => recipient.staff);

  return Promise.all(
    recipients.map(async (staff) => {
      if (!staff) {
        return {
          recipient: "Unknown recipient",
          ok: false,
          error: new Error("Recipient staff information is missing"),
        };
      }

      const recipientName = getDisplayName(staff) || "Everyone";

      const htmlBody = renderNotificationEmail({
        recipientName,
        issuedBy: authorName,
        subject: cleanSubject,
        status,
        notificationType,
        link,
        author: authorName,
        timeText,
        timezoneText,
        entityLabel,
        reviewText,
        primaryAction,
        secondaryAction,
        ctaText,
      });

      try {
        await sendEmail(authorName, staff.email, emailSubject, htmlBody);
        return { recipient: staff.email, ok: true };
      } catch (error) {
        return {
          recipient: staff.email,
          ok: false,
          error,
        };
      }
    }),
  );
}

function getDisplayName(
  person?: Pick<StaffLike, "firstName" | "lastName"> | null,
): string {
  return [person?.firstName?.trim(), person?.lastName?.trim()]
    .filter((part): part is string => Boolean(part))
    .join(" ");
}

function toDisplayType(value: string | null | undefined): string {
  if (!value) return "N/A";
  return value.replaceAll("_", " ");
}
