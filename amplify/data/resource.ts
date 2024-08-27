import { type ClientSchema, a, defineData } from "@aws-amplify/backend";
import { listUsers } from "./list-users/resource";
import { postConfirmation } from "../auth/post-confirmation/resouce";

const schema = a
  .schema({
    listUsers: a
      .query()
      .arguments({
        attributesToGet: a.string().required().array(),
        limit: a.integer(),
        paginationToken: a.string(),
        filter: a.string(),
      })
      .authorization((allow) => [allow.authenticated()])
      .handler(a.handler.function(listUsers))
      .returns(a.json()),
    Staff: a
      .model({
        id: a.string().required(),
        name: a.string().required(),
        email: a.email().required(),
        archived: a.boolean().required().default(false),
        documents: a.hasMany("Document", "staffId"),
        notices: a.hasMany("Notice", "staffId"),
        notifications: a.hasMany("Notification", "staffId"),
        aircraft: a.hasMany("AircraftStaff", "staffId"),
        roles: a.hasMany("RoleStaff", "staffId"),
        subcategories: a.hasMany("StaffSubcategory", "staffId"),
      })
      .secondaryIndexes((index) => [index("email")])
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    Category: a
      .model({
        name: a.string().required(),
        archived: a.boolean().required().default(false),
        description: a.string(),
        subcategories: a.hasMany("Subcategory", "categoryId"),
      })
      .secondaryIndexes((index) => [index("name")])
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    Subcategory: a
      .model({
        name: a.string().required(),
        archived: a.boolean().required().default(false),
        description: a.string(),
        categoryId: a.id().required(),
        category: a.belongsTo("Category", "categoryId"),
        documents: a.hasMany("Document", "subcategoryId"),
        staff: a.hasMany("StaffSubcategory", "subcategoryId"),
      })
      .secondaryIndexes((index) => [index("name")])
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    Document: a
      .model({
        name: a.string().required(),
        archived: a.boolean().required().default(false),
        subcategoryId: a.id(),
        subcategory: a.belongsTo("Subcategory", "subcategoryId"),
        staffId: a.id(),
        staff: a.belongsTo("Staff", "staffId"),
        aircraft: a.hasMany("AircraftDocument", "documentId"),
      })
      .secondaryIndexes((index) => [index("name")])
      .authorization((allow) => [
        allow.authenticated().to(["create", "read", "update"]),
        allow.groups(["admins"]),
      ]),
    Role: a
      .model({
        name: a.string().required(),
        archived: a.boolean().required().default(false),
        description: a.string(),
        staff: a.hasMany("RoleStaff", "roleId"),
      })
      .secondaryIndexes((index) => [index("name")])
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    RoleStaff: a
      .model({
        roleId: a.id().required(),
        staffId: a.id().required(),
        role: a.belongsTo("Role", "roleId"),
        staff: a.belongsTo("Staff", "staffId"),
      })
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    StaffSubcategory: a
      .model({
        accessLevel: a.integer().required(),
        subcategoryId: a.id().required(),
        staffId: a.id().required(),
        subcategory: a.belongsTo("Subcategory", "subcategoryId"),
        staff: a.belongsTo("Staff", "staffId"),
      })
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    Aircraft: a
      .model({
        name: a.string().required(),
        archived: a.boolean().required().default(false),
        description: a.string(),
        staff: a.hasMany("AircraftStaff", "aircraftId"),
        document: a.hasMany("AircraftDocument", "aircraftId"),
        notices: a.hasMany("AircraftNotice", "aircraftId"),
      })
      .secondaryIndexes((index) => [index("name")])
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    AircraftStaff: a
      .model({
        aircraftId: a.id().required(),
        staffId: a.id().required(),
        aircraft: a.belongsTo("Aircraft", "aircraftId"),
        staff: a.belongsTo("Staff", "staffId"),
      })
      .authorization((allow) => [
        allow.authenticated().to(["read"]),
        allow.groups(["admins"]),
      ]),
    AircraftDocument: a
      .model({
        aircraftId: a.id().required(),
        documentId: a.id().required(),
        aircraft: a.belongsTo("Aircraft", "aircraftId"),
        document: a.belongsTo("Document", "documentId"),
      })
      .authorization((allow) => [
        allow.authenticated().to(["create", "read", "update"]),
        allow.groups(["admins"]),
      ]),
    AircraftNotice: a
      .model({
        aircraftId: a.id().required(),
        noticeId: a.id().required(),
        aircraft: a.belongsTo("Aircraft", "aircraftId"),
        notice: a.belongsTo("Notice", "noticeId"),
      })
      .authorization((allow) => [
        allow.authenticated().to(["create", "read", "update"]),
        allow.groups(["admins"]),
      ]),
    Notice: a
      .model({
        subject: a.string().required(),
        type: a.enum(["Notice_to_Crew", "Safety_notice", "Hazard_report"]),
        status: a.enum(["Draft", "Open", "Pending", "Resolved"]),
        archived: a.boolean().required().default(false),
        details: a.json().required(),
        noticed_at: a.datetime(),
        deadline_at: a.datetime(),
        staffId: a.id(),
        author: a.belongsTo("Staff", "staffId"),
        recipients: a.hasMany("Notification", "noticeId"),
        aircraft: a.hasMany("AircraftNotice", "noticeId"),
        documents: a.hasMany("NoticeDocument", "noticeId"),
      })
      .secondaryIndexes((index) => [index("subject")])
      .authorization((allow) => [
        allow.authenticated().to(["create", "read", "update"]),
        allow.groups(["admins"]),
      ]),
    Notification: a
      .model({
        read_at: a.datetime(),
        noticeId: a.id().required(),
        staffId: a.id().required(),
        notice: a.belongsTo("Notice", "noticeId"),
        staff: a.belongsTo("Staff", "staffId"),
      })
      .authorization((allow) => [
        allow.authenticated().to(["create", "read", "update"]),
        allow.groups(["admins"]),
      ]),
    NoticeDocument: a
      .model({
        noticeId: a.id().required(),
        notices: a.belongsTo("Notice", "noticeId"),
        name: a.string().required(),
      })
      .authorization((allow) => [
        allow.authenticated().to(["create", "read", "update"]),
        allow.groups(["admins"]),
      ]),
  })
  .authorization((allow) => [
    allow.authenticated(),
    allow.resource(postConfirmation),
  ]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: "userPool",
  },
});
