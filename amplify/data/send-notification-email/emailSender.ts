import { SESv2Client, SendEmailCommand } from "@aws-sdk/client-sesv2";

const emailClient = new SESv2Client({ region: "us-west-2" });

export async function sendEmail(
  author: string,
  recipient: string,
  subject: string,
  htmlBody: string,
) {
  const command = new SendEmailCommand({
    FromEmailAddressIdentityArn:
      "arn:aws:ses:us-west-2:891377389351:identity/adsats.com",
    FromEmailAddress: `${author} <noreply@adsats.com>`,
    Destination: {
      ToAddresses: [recipient],
      BccAddresses: [],
      CcAddresses: [],
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
