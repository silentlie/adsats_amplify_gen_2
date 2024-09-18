import type { Schema } from "../../../resource";
import { env } from "$amplify/env/delete-staff-override";
import { generateClient, GraphQLResult } from "aws-amplify/data";
import { Amplify } from "aws-amplify";
import {
  deleteStaff,
  deleteStaffSubcategory,
  deleteRoleStaff,
  deleteAircraftStaff,
  deleteNoticeStaff,
  deleteUser,
} from "../../../graphql/mutations";
import {
  listAircraftStaffs,
  listNoticeStaffs,
  listRoleStaffs,
  listStaffSubcategories,
} from "../../../graphql/queries";

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

type Handler = Schema["deleteStaffOverride"]["functionHandler"];
const client = generateClient<Schema>();

export const handler: Handler = async (event) => {
  const { staffId } = event.arguments;
  const promises: Promise<GraphQLResult<any>>[] = [];
  const [
    staffSubcategoriesResult,
    roleStaffsResult,
    noticeStaffsResult,
    aircraftStaffsResult,
  ] = await Promise.all([
    client.graphql({
      query: listStaffSubcategories,
      variables: { filter: { staffId: { eq: staffId } } },
    }),
    client.graphql({
      query: listRoleStaffs,
      variables: { filter: { staffId: { eq: staffId } } },
    }),
    client.graphql({
      query: listNoticeStaffs,
      variables: { filter: { staffId: { eq: staffId } } },
    }),
    client.graphql({
      query: listAircraftStaffs,
      variables: { filter: { staffId: { eq: staffId } } },
    }),
  ]);
  staffSubcategoriesResult.data.listStaffSubcategories.items.forEach(
    (staffSubcategory) => {
      console.log(
        `Deleting StaffSubcategory with staffId: ${staffSubcategory.staffId}, subcategoryId: ${staffSubcategory.subcategoryId}`,
      );
      promises.push(
        client.graphql({
          query: deleteStaffSubcategory,
          variables: {
            input: {
              // staffId: staffSubcategory.staffId,
              // subcategoryId: staffSubcategory.subcategoryId,
              id: staffSubcategory.id,
            },
          },
        }),
      );
    },
  );
  roleStaffsResult.data.listRoleStaffs.items.forEach((roleStaff) => {
    console.log(
      `Deleting RoleStaff with staffId: ${roleStaff.staffId}, roleId: ${roleStaff.roleId}`,
    );
    promises.push(
      client.graphql({
        query: deleteRoleStaff,
        variables: {
          input: {
            // staffId: roleStaff.staffId,
            // roleId: roleStaff.roleId,
            id: roleStaff.id,
          },
        },
      }),
    );
  });
  noticeStaffsResult.data.listNoticeStaffs.items.forEach((noticeStaff) => {
    console.log(
      `Deleting NoticeStaff with staffId: ${noticeStaff.staffId}, noticeId: ${noticeStaff.noticeId}`,
    );
    promises.push(
      client.graphql({
        query: deleteNoticeStaff,
        variables: {
          input: {
            // staffId: noticeStaff.staffId,
            // noticeId: noticeStaff.noticeId,
            id: noticeStaff.id,
          },
        },
      }),
    );
  });
  aircraftStaffsResult.data.listAircraftStaffs.items.forEach(
    (aircraftStaff) => {
      console.log(
        `Deleting AircraftStaff with aircraftId: ${aircraftStaff.aircraftId}, staffId: ${aircraftStaff.staffId}`,
      );
      promises.push(
        client.graphql({
          query: deleteAircraftStaff,
          variables: {
            input: {
              // aircraftId: aircraftStaff.aircraftId,
              // staffId: aircraftStaff.staffId,
              id: aircraftStaff.id,
            },
          },
        }),
      );
    },
  );
  console.log(`Deleting user with id: ${staffId}`);
  promises.push(
    client.graphql({
      query: deleteUser,
      variables: { id: staffId },
    }),
  );
  console.log(`Deleting staff with id: ${staffId}`);
  promises.push(
    client.graphql({
      query: deleteStaff,
      variables: { input: { id: staffId } },
    }),
  );
  const result = await Promise.all(promises);
  return result[result.length - 1];
};
