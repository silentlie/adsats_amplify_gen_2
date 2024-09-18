import type { Schema } from "../../../resource";
import { env } from "$amplify/env/update-notice-staff-override";
import { generateClient } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  listAircraftStaffs,
  listNoticeStaffs,
  listRoleStaffs,
} from "../../../graphql/queries";
import { createNoticeStaff, deleteNoticeStaff, updateNoticeStaff } from "../../../graphql/mutations";

Amplify.configure(
  {
    API: {
      GraphQL: {
        endpoint: env.AMPLIFY_DATA_GRAPHQL_ENDPOINT,
        region: env.AWS_REGION,
        defaultAuthMode: "iam",
      },
    },
  },
  {
    Auth: {
      credentialsProvider: {
        getCredentialsAndIdentityId: async () => ({
          credentials: {
            accessKeyId: env.AWS_ACCESS_KEY_ID,
            secretAccessKey: env.AWS_SECRET_ACCESS_KEY,
            sessionToken: env.AWS_SESSION_TOKEN,
          },
        }),
        clearCredentialsAndIdentityId: () => {
          /* noop */
        },
      },
    },
  },
);

type Handler = Schema["updateNoticeStaffOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  // const { noticeId, staffIds, aircraftIds, roleIds } = event.arguments;
  // const listPromises: Promise<any>[] = [];
  // listPromises.push(
  //   client
  //     .graphql({
  //       query: listNoticeStaffs,
  //       variables: {
  //         filter: { noticeId: { eq: noticeId } },
  //       },
  //     })
  //     .then((result) =>
  //       result.data.listNoticeStaffs.items.map((item) => item.staffId),
  //     ),
  // );
  // if (aircraftIds) {
  //   listPromises.push(
  //     client
  //       .graphql({
  //         query: listAircraftStaffs,
  //         variables: {
  //           filter: {
  //             or: aircraftIds.map((aircraftId) => ({
  //               aircraftId: { eq: aircraftId },
  //             })),
  //           },
  //         },
  //       })
  //       .then((result) =>
  //         result.data.listAircraftStaffs.items.map((item) => item.staffId),
  //       ),
  //   );
  // }
  // if (roleIds) {
  //   listPromises.push(
  //     client
  //       .graphql({
  //         query: listRoleStaffs,
  //         variables: {
  //           filter: {
  //             or: roleIds.map((roleId) => ({
  //               roleId: { eq: roleId },
  //             })),
  //           },
  //         },
  //       })
  //       .then((result) =>
  //         result.data.listRoleStaffs.items.map((item) => item.staffId),
  //       ),
  //   );
  // }
  // const listResult = await Promise.all(listPromises);
  // const oldStaffIds = listResult[0];
  // const aircraftStaffIds = new Set(listResult[1]);
  // const roleStaffIds = new Set(listResult[2]);
  // const commonStaffIds = [...aircraftStaffIds].filter((item) =>
  //   roleStaffIds.has(item),
  // );
  // const resultPromises: Promise<any>[] = [];
  // const newStaffIds =
  //   staffIds != null
  //     ? new Set([...commonStaffIds, ...staffIds])
  //     : new Set(commonStaffIds);
  // oldStaffIds.forEach((oldStaffId) => {
  //   if (newStaffIds.has(oldStaffId)) {
  //     console.log(
  //       `Updating noticeStaff with staffId: ${oldStaffId} and noticeId: ${noticeId}`,
  //     );
  //     resultPromises.push(
  //       client.graphql({
  //         query: updateNoticeStaff,
  //         variables: {
  //           input: {
  //             // noticeId: noticeId,
  //             // staffId: oldStaffId,
  //             id: oldStaffId,
  //             read_at: null
  //           },
  //         },
  //       }),
  //     );
  //     newStaffIds.delete(oldStaffId)
  //   } else {
  //     console.log(
  //       `Deleting noticeStaff with staffId: ${oldStaffId} and noticeId: ${noticeId}`,
  //     );
  //     resultPromises.push(
  //       client.graphql({
  //         query: deleteNoticeStaff,
  //         variables: {
  //           input: {
  //             noticeId: noticeId,
  //             staffId: oldStaffId,
  //           },
  //         },
  //       }),
  //     );
  //   }
  // })
  // newStaffIds.forEach((newStaffId) => {
  //   console.log(
  //     `Creating noticeStaff with staffId: ${newStaffId} and noticeId: ${noticeId}`,
  //   );
  //   resultPromises.push(
  //     client.graphql({
  //       query: createNoticeStaff,
  //       variables: {
  //         input: {
  //           noticeId: noticeId,
  //           staffId: newStaffId,
  //         },
  //       },
  //     }),
  //   );
  // })
  // const result = await Promise.all(resultPromises);
  return {};
};
