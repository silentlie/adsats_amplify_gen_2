const compactDateFormatter = new Intl.DateTimeFormat("en-GB", {
  day: "2-digit",
  month: "short",
  year: "numeric",
});

const toCompactDateString = (value: string): string => {
  return compactDateFormatter
    .format(new Date(value))
    .replaceAll(" ", "")
    .toUpperCase();
};

const escapeHtml = (value: string): string => {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");
};

const htmlTemplate = `
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Document Reminder</title>
  </head>
  <body style="margin:0; padding:0; background-color:#f4f6f8; font-family:Arial, Helvetica, sans-serif; color:#111827;">
    <div style="margin:0; padding:24px 12px; background-color:#f4f6f8;">
      <div style="max-width:600px; margin:0 auto; background-color:#ffffff; border:1px solid #e5e7eb; border-radius:8px; overflow:hidden;">

        <div style="padding:24px 24px 12px 24px; background-color:#ffffff;">
          <h1 style="margin:0; font-size:20px; line-height:28px; font-weight:700; color:#111827;">
            Document Reminder
          </h1>
        </div>

        <div style="padding:0 24px 24px 24px;">
          <p style="margin:0 0 16px 0; font-size:16px; line-height:24px;">
            Dear {{firstName}} {{lastName}},
          </p>

          <p style="margin:0 0 16px 0; font-size:16px; line-height:24px;">
            This is a reminder that the document "<strong>{{documentTitle}}</strong>" is due to expire on <strong>{{expiryDate}}</strong>.
          </p>

          <div style="margin:0 0 16px 0; padding:16px; background-color:#f9fafb; border:1px solid #e5e7eb; border-radius:6px;">
            <p style="margin:0 0 8px 0; font-size:14px; line-height:20px; color:#374151;">
              Category: <strong>{{categoryName}}</strong>
            </p>
            <p style="margin:0; font-size:14px; line-height:20px; color:#374151;">
              Subcategory: <strong>{{subcategoryName}}</strong>
            </p>
          </div>

          <p style="margin:0 0 24px 0; font-size:16px; line-height:24px;">
            Please review the document in the category and subcategory above and take any necessary action.
          </p>

          <p style="margin:0 0 24px 0;">
            <a
              href="https://adsats.com/documents"
              style="display:inline-block; padding:12px 20px; background-color:#2563eb; color:#ffffff; text-decoration:none; font-size:14px; line-height:20px; font-weight:700; border-radius:6px;"
            >
              View Document
            </a>
          </p>

          <p style="margin:0; font-size:16px; line-height:24px;">
            Best regards,<br />
            The ADSATS Team
          </p>
        </div>

      </div>
    </div>
  </body>
</html>
`;

export function buildReminderEmail({
  firstName,
  lastName,
  documentTitle,
  categoryName,
  subcategoryName,
  expiredAt,
}: {
  firstName: string;
  lastName: string;
  documentTitle: string;
  categoryName: string;
  subcategoryName: string;
  expiredAt: string;
}) {
  const expiryDate = toCompactDateString(expiredAt);

  const html = htmlTemplate
    .replace("{{firstName}}", escapeHtml(firstName))
    .replace("{{lastName}}", escapeHtml(lastName))
    .replace("{{documentTitle}}", escapeHtml(documentTitle))
    .replace("{{categoryName}}", escapeHtml(categoryName))
    .replace("{{subcategoryName}}", escapeHtml(subcategoryName))
    .replace("{{expiryDate}}", escapeHtml(expiryDate));

  return {
    html,
    expiryDate,
  };
}
