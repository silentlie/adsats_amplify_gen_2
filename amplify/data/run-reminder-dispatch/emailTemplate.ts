import mjml2html from "mjml";

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

const mjml = `
<mjml>
  <mj-body>
    <mj-section>
      <mj-column>

        <mj-text font-size="20px" font-weight="bold">
          Document Reminder
        </mj-text>

        <mj-text>
          Dear {{firstName}} {{lastName}},
        </mj-text>

        <mj-text>
          This is a reminder that the document "<strong>{{documentTitle}}</strong>" is due to expire on <strong>{{expiryDate}}</strong>.
        </mj-text>

        <mj-text>
          Category: <strong>{{categoryName}}</strong><br/>
          Subcategory: <strong>{{subcategoryName}}</strong>
        </mj-text>

        <mj-text>
          Please review the document in the category and subcategory above and take any necessary action.
        </mj-text>

        <mj-button href="https://adsats.com/documents">
          View Document
        </mj-button>

        <mj-text>
          Best regards,<br/>
          The ADSATS Team
        </mj-text>

      </mj-column>
    </mj-section>
  </mj-body>
</mjml>
`;

export function buildReminderEmail({
  firstName,
  lastName,
  documentTitle,
  categoryName,
  subcategoryName,
  expiredAt,
  reminderId,
}: {
  firstName: string;
  lastName: string;
  documentTitle: string;
  categoryName: string;
  subcategoryName: string;
  expiredAt: string;
  reminderId: string;
}) {
  const expiryDate = toCompactDateString(expiredAt);

  const filledMjml = mjml
    .replace("{{firstName}}", escapeHtml(firstName))
    .replace("{{lastName}}", escapeHtml(lastName))
    .replace("{{documentTitle}}", escapeHtml(documentTitle))
    .replace("{{categoryName}}", escapeHtml(categoryName))
    .replace("{{subcategoryName}}", escapeHtml(subcategoryName))
    .replace("{{expiryDate}}", escapeHtml(expiryDate));

  const { html, errors } = mjml2html(filledMjml);

  if (errors.length > 0) {
    throw new Error(
      `MJML compile failed for reminder ${reminderId}: ${JSON.stringify(errors)}`,
    );
  }

  return {
    html,
    expiryDate,
  };
}
