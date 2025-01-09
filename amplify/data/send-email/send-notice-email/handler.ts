import { SESv2Client, SendEmailCommand } from "@aws-sdk/client-sesv2";
import type { Schema } from "../../resource";

type Handler = Schema["sendNoticeEmail"]["functionHandler"];
const client = new SESv2Client();

export const handler: Handler = async (event) => {
  const {
    subject,
    type,
    status,
    details,
    noticed_at,
    deadline_at,
    author,
    recipients,
  } = event.arguments;
  const subjectStr = `${type!.replace(/_/g, " ")}: ${subject} [${status}]`;
  let bodyStr = `Notice Date: ${noticed_at}\nDeadline Date: ${deadline_at}`;

  if (type == "Notice_to_Crew") {
    bodyStr += `Message: ${JSON.stringify(details)}`;
    bodyStr += `Type: ${typeof details}`;
  }
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
          Data: subjectStr,
        },
        Body: {
          Text: {
            Data: bodyStr,
          },
        },
      },
    },
  });
  const response = await client.send(command);
  return response;
};
