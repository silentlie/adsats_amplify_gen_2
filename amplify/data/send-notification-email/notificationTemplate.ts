function escapeHtml(value: string): string {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");
}

export function renderNotificationEmail({
  recipientName,
  issuedBy,
  subject,
  status,
  notificationType,
  link,
  author,
  timeText,
  timezoneText,
  entityLabel,
  reviewText,
  primaryAction,
  secondaryAction,
  ctaText,
}: {
  recipientName: string;
  issuedBy: string;
  subject: string;
  status: string;
  notificationType: string;
  link: string;
  author: string;
  timeText: string;
  timezoneText: string;
  entityLabel: string;
  reviewText: string;
  primaryAction: string;
  secondaryAction: string;
  ctaText: string;
}): string {
  return `<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ADSATS Notification</title>
    <style>
      * { box-sizing: border-box; }
      body {
        margin: 0;
        padding: 24px;
        background: #f3f6fa;
        font-family: Arial, Helvetica, sans-serif;
        color: #243240;
      }
      a { color: #2d5f9b; }
      .email {
        max-width: 680px;
        margin: 0 auto;
        background: #ffffff;
        border: 1px solid #cfdbeb;
      }
      .header {
        background: #d9e7fb;
        padding: 28px 24px 24px;
        text-align: center;
      }
      .title {
        margin: 0;
        font-size: 28px;
        line-height: 1.2;
        font-weight: 700;
      }
      .meta {
        background: #385975;
        color: #ffffff;
        padding: 14px 24px;
        text-align: right;
        font-size: 14px;
        line-height: 1.4;
      }
      .content { padding: 28px 24px 32px; }
      .greeting {
        margin: 0 0 14px;
        font-size: 18px;
        font-weight: 700;
        color: #2d5f9b;
      }
      .text {
        margin: 0 0 16px;
        font-size: 16px;
        line-height: 1.5;
        color: #516170;
      }
      .notice {
        background: #f5f8fc;
        border: 1px solid #cfdbeb;
        border-top: 6px solid #2d678f;
        padding: 18px;
        margin: 0 0 24px;
      }
      .badge {
        display: inline-block;
        margin-bottom: 14px;
        padding: 6px 12px;
        background: #d8e7fb;
        border: 1px solid #b7cdee;
        font-size: 13px;
        font-weight: 700;
        color: #294765;
      }
      .detail {
        margin: 8px 0;
        font-size: 16px;
        line-height: 1.5;
      }
      .detail strong { color: #2d5f9b; }
      .button {
        display: inline-block;
        margin: 0 0 20px;
        padding: 14px 22px;
        background: #8eb4f2;
        color: #1f2f40;
        text-decoration: none;
        font-size: 16px;
        font-weight: 700;
      }
      .link {
        margin: 0 0 22px;
        word-break: break-word;
      }
      .actions {
        margin: 0 0 24px;
        padding: 0;
        list-style: none;
        border: 1px solid #cfdbeb;
      }
      .actions li {
        padding: 14px 16px;
        background: #eef4fb;
        border-left: 4px solid #8eb4f2;
      }
      .actions li + li { border-top: 1px solid #d9e3f0; }
      .signoff {
        margin: 0;
        font-size: 16px;
        line-height: 1.5;
      }
      .footer {
        border-top: 1px solid #cfdbeb;
        padding: 18px 24px;
        text-align: center;
        font-size: 13px;
        color: #6c7885;
        background: #fafcff;
      }
    </style>
  </head>
  <body>
    <div class="email">
      <div class="header">
        <h1 class="title">ADSATS - Aviation Document Storage and Tracking System</h1>
      </div>
      <div class="meta">
        ${escapeHtml(timeText)}<br />
        (Timezone: ${escapeHtml(timezoneText)})
      </div>
      <div class="content">
        <p class="greeting">Dear ${escapeHtml(recipientName)},</p>
        <p class="text">
          A new ${escapeHtml(entityLabel)} has been issued in the ADSATS system. Please review the details below:
        </p>
        <div class="notice">
          <div class="badge">${escapeHtml(notificationType)}</div>
          <p class="detail"><strong>Issued By:</strong> ${escapeHtml(issuedBy)}</p>
          <p class="detail"><strong>Subject:</strong> ${escapeHtml(subject)}</p>
          <p class="detail"><strong>Status:</strong> ${escapeHtml(status)}</p>
        </div>
        <p class="text">Please review the ${escapeHtml(entityLabel)} by clicking the link below:</p>
        <a class="button" href="${escapeHtml(link)}">${escapeHtml(ctaText)}</a>
        <p class="text">If the above link does not work, copy and paste this URL into your browser:</p>
        <p class="link"><a href="${escapeHtml(link)}">${escapeHtml(link)}</a></p>
        <ul class="actions">
          <li>${escapeHtml(reviewText)}</li>
          <li>${escapeHtml(primaryAction)}</li>
          <li>${escapeHtml(secondaryAction)}</li>
        </ul>
        <p class="signoff">Best regards,<br /><strong>${escapeHtml(author)}</strong></p>
      </div>
      <div class="footer">This is an automated message, please do not reply.</div>
    </div>
  </body>
</html>`;
}