import { SESv2Client, SendEmailCommand } from "@aws-sdk/client-sesv2";

const emailClient = new SESv2Client({ region: "us-west-2" });

export async function sendEmail({
  subject,
  htmlBody,
  recipients,
}: {
  subject: string;
  htmlBody: string;
  recipients: string[];
}) {
  if (recipients.length === 0) {
    throw new Error("No recipients provided for sendEmail");
  }

  const command = new SendEmailCommand({
    FromEmailAddressIdentityArn:
      "arn:aws:ses:us-west-2:891377389351:identity/adsats.com",
    FromEmailAddress: `ADSATS <noreply@adsats.com>`,
    Destination: {
      ToAddresses: recipients,
    },
    Content: {
      Simple: {
        Subject: {
          Data: subject,
        },
        Body: {
          Html: {
            Data: htmlBody,
          },
        },
      },
    },
  });

  return await emailClient.send(command);
}
