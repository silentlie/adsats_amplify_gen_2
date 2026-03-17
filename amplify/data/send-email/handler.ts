import { SESv2Client, SendEmailCommand } from "@aws-sdk/client-sesv2";
import type { Schema } from "../resource";

type Handler = Schema["sendEmail"]["functionHandler"];
const client = new SESv2Client({ region: "us-west-2" });

export const handler: Handler = async (event) => {
  const input = event.arguments ?? event;

  const {
    subject,
    htmlBody,
    author,
    recipients,
  } = input;

  const command = new SendEmailCommand({
    FromEmailAddressIdentityArn:
      "arn:aws:ses:us-west-2:891377389351:identity/adsats.com",
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
