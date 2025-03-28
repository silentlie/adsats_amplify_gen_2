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
    noticedAt,
    deadlineAt,
    author,
    recipients,
  } = event.arguments;

  const subjectStr = `${type!.replace(/_/g, " ")}: ${subject} [${status}]`;
  let bodyStr = "";
  if (noticedAt != null) {
    bodyStr += `Notice Date: ${noticedAt}\n`;
  }
  if (deadlineAt != null) {
    bodyStr += `Deadline Date: ${deadlineAt}\n`;
  }
  if (typeof details === "string") {
    const json = JSON.parse(details);
    if (type == "Notice_to_Crew") {
      bodyStr += `Message: ${json["message"]}\n`;
    } else if (type == "Safety_notice") {
      bodyStr += `Potential safety risk: ${json["title"]}`;
      bodyStr += `Message: ${json["message"]}\n`;
    } else if (type == "Hazard_report") {
      bodyStr += `Location: ${json["location"]}\n`;
      bodyStr += `This is a ${json["isConfidential"]} hazard report\n`;
      bodyStr += `Describe the Hazard or the Event:\n${json["description"]}\n`;
    }
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
