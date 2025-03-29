import { SESv2Client, SendEmailCommand } from "@aws-sdk/client-sesv2";
import type { Schema } from "../resource";

type Handler = Schema["sendEmail"]["functionHandler"];
const client = new SESv2Client();

export const handler: Handler = async (event) => {
  const {
    subject,
    htmlBody,
    author,
    recipients,
  } = event.arguments;

  const command = new SendEmailCommand({
    FromEmailAddressIdentityArn:
      "arn:aws:ses:ap-southeast-2:891377389351:identity/adsats.com",
    FromEmailAddress: `${author} <noreply@adsats.com>`,
    Destination: {
      ToAddresses: recipients,
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
          }
        },
      },
    },
  });
  const response = await client.send(command);
  return response;
};
