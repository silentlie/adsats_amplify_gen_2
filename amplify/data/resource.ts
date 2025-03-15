import { type ClientSchema, a, defineData } from "@aws-amplify/backend";
import { createUser } from "./cognito-admin/create-user/resource";
import { deleteUser } from "./cognito-admin/delete-user/resouce";
import { enableUser } from "./cognito-admin/enable-user/resouce";
import { disableUser } from "./cognito-admin/disable-user/resouce";
import { sendNoticeEmail } from "./send-email/send-notice-email/resouce";

const schema = a
  .schema({
    sendNoticeEmail: a
      .mutation()
      .arguments({
        subject: a.string().required(),
        type: a.enum(["Notice_to_Crew", "Safety_notice", "Hazard_report"]),
        status: a.enum(["Draft", "Open", "Pending", "Resolved"]),
        details: a.json().required(),
        noticedAt: a.datetime(),
        deadlineAt: a.datetime(),
        author: a.string(),
        recipients: a.string().required().array().required(),
      })
      .handler(a.handler.function(sendNoticeEmail))
      .returns(a.json()),
    createUser: a
      .mutation()
      .arguments({
        email: a.email().required(),
        name: a.string().required(),
        temporaryPassword: a.string().required(),
      })
      .handler(a.handler.function(createUser))
      .returns(a.json()),
    deleteUser: a
      .mutation()
      .arguments({
        id: a.id().required(),
      })
      .handler(a.handler.function(deleteUser))
      .returns(a.json()),
    enableUser: a
      .mutation()
      .arguments({
        id: a.id().required(),
      })
      .handler(a.handler.function(enableUser))
      .returns(a.json()),
    disableUser: a
      .mutation()
      .arguments({
        id: a.id().required(),
      })
      .handler(a.handler.function(disableUser))
      .returns(a.json()),
    Staff: a.model({
      id: a.id().required(),
      name: a.string().required(),
      email: a.email().required(),
      archived: a.boolean().required().default(false),
      documents: a.hasMany("Document", "staffId"),
      notices: a.hasMany("Notice", "staffId"),
      notifications: a.hasMany("NoticeStaff", "staffId"),
      aircraft: a.hasMany("AircraftStaff", "staffId"),
      roles: a.hasMany("RoleStaff", "staffId"),
      subcategories: a.hasMany("StaffSubcategory", "staffId"),
      crewDocuments: a.hasMany("CrewDocument", "staffId"),
      reports: a.hasMany("Report", "auditorId"),
      reportNotifications: a.hasMany("ReportStaff", "staffId"),
      closedReport: a.hasMany("Report", "closerId"),
    }),
    Category: a.model({
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      description: a.string(),
      subcategories: a.hasMany("Subcategory", "categoryId"),
    }),
    Subcategory: a.model({
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      description: a.string(),
      categoryId: a.id().required(),
      category: a.belongsTo("Category", "categoryId"),
      documents: a.hasMany("Document", "subcategoryId"),
      staff: a.hasMany("StaffSubcategory", "subcategoryId"),
    }),
    Document: a.model({
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      subcategoryId: a.id(),
      subcategory: a.belongsTo("Subcategory", "subcategoryId"),
      staffId: a.id(),
      staff: a.belongsTo("Staff", "staffId"),
      aircraft: a.hasMany("AircraftDocument", "documentId"),
    }),
    Role: a.model({
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      description: a.string(),
      staff: a.hasMany("RoleStaff", "roleId"),
      categories: a.hasMany("CrewDocumentCategory", "roleId"),
    }),
    RoleStaff: a.model({
      roleId: a.id().required(),
      staffId: a.id().required(),
      role: a.belongsTo("Role", "roleId"),
      staff: a.belongsTo("Staff", "staffId"),
    }),
    StaffSubcategory: a.model({
      accessLevel: a.integer().required(),
      subcategoryId: a.id().required(),
      staffId: a.id().required(),
      subcategory: a.belongsTo("Subcategory", "subcategoryId"),
      staff: a.belongsTo("Staff", "staffId"),
    }),
    Aircraft: a.model({
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      description: a.string(),
      staff: a.hasMany("AircraftStaff", "aircraftId"),
      document: a.hasMany("AircraftDocument", "aircraftId"),
      notices: a.hasMany("AircraftNotice", "aircraftId"),
    }),
    AircraftStaff: a.model({
      aircraftId: a.id().required(),
      staffId: a.id().required(),
      aircraft: a.belongsTo("Aircraft", "aircraftId"),
      staff: a.belongsTo("Staff", "staffId"),
    }),
    AircraftDocument: a.model({
      aircraftId: a.id().required(),
      documentId: a.id().required(),
      aircraft: a.belongsTo("Aircraft", "aircraftId"),
      document: a.belongsTo("Document", "documentId"),
    }),
    AircraftNotice: a.model({
      aircraftId: a.id().required(),
      noticeId: a.id().required(),
      aircraft: a.belongsTo("Aircraft", "aircraftId"),
      notice: a.belongsTo("Notice", "noticeId"),
    }),
    Notice: a.model({
      subject: a.string().required(),
      type: a.enum(["Notice_to_Crew", "Safety_notice", "Hazard_report"]),
      status: a.enum(["Draft", "Open", "Pending", "Resolved"]),
      archived: a.boolean().required().default(false),
      details: a.json().required(),
      noticedAt: a.datetime(),
      deadlineAt: a.datetime(),
      staffId: a.id().required(),
      author: a.belongsTo("Staff", "staffId"),
      recipients: a.hasMany("NoticeStaff", "noticeId"),
      aircraft: a.hasMany("AircraftNotice", "noticeId"),
      documents: a.hasMany("NoticeDocument", "noticeId"),
    }),
    NoticeStaff: a.model({
      readAt: a.datetime(),
      noticeId: a.id().required(),
      staffId: a.id().required(),
      notice: a.belongsTo("Notice", "noticeId"),
      staff: a.belongsTo("Staff", "staffId"),
    }),
    NoticeDocument: a.model({
      noticeId: a.id().required(),
      notices: a.belongsTo("Notice", "noticeId"),
      name: a.string().required(),
    }),
    CrewDocumentCategory: a.model({
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      description: a.string(),
      roleId: a.id().required(),
      role: a.belongsTo("Role", "roleId"),
      crewDocuments: a.hasMany("CrewDocument", "categoryId"),
    }),
    CrewDocument: a.model({
      categoryId: a.id().required(),
      staffId: a.id().required(),
      name: a.string().required(),
      archived: a.boolean().required().default(false),
      category: a.belongsTo("CrewDocumentCategory", "categoryId"),
      staff: a.belongsTo("Staff", "staffId"),
    }),
    Report: a.model({
      subject: a.string().required(),
      type: a.enum(["External_audit_report", "Internal_audit_report"]),
      status: a.enum(["Draft", "Open", "Pending", "Closed"]),
      archived: a.boolean().required().default(false),
      details: a.json().required(),
      auditorId: a.id().required(),
      auditor: a.belongsTo("Staff", "auditorId"),
      reportedAt: a.datetime(),
      closerId: a.id().required(),
      closer: a.belongsTo("Staff", "closerId"),
      closeAt: a.datetime(),
      recipients: a.hasMany("ReportStaff", "reportId"),
      documents: a.hasMany("ReportDocument", "reportId"),
    }),
    ReportDocument: a.model({
      reportId: a.id().required(),
      reports: a.belongsTo("Report", "reportId"),
      name: a.string().required(),
    }),
    ReportStaff: a
      .model({
        readAt: a.datetime(),
        reportId: a.id().required(),
        staffId: a.id().required(),
        report: a.belongsTo("Report", "reportId"),
        staff: a.belongsTo("Staff", "staffId"),
      }),
  })
  .authorization((allow) => [allow.authenticated()]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: "userPool",
  },
});
