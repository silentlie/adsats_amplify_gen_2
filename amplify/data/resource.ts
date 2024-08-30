import { type ClientSchema, a, defineData } from "@aws-amplify/backend";
import { listUsers } from "./list-users/resource";
import { createUser } from "./create-user/resource";
import { deleteUser } from "./delete-user/resouce";
import { enableUser } from "./enable-user/resouce";
import { disableUser } from "./disable-user/resouce";

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
      .handler(a.handler.function(listUsers))
      .returns(a.json()),
    createUser: a
      .mutation()
      .arguments({
        id: a.id().required(),
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
      noticed_at: a.datetime(),
      deadline_at: a.datetime(),
      staffId: a.id(),
      author: a.belongsTo("Staff", "staffId"),
      recipients: a.hasMany("Notification", "noticeId"),
      aircraft: a.hasMany("AircraftNotice", "noticeId"),
      documents: a.hasMany("NoticeDocument", "noticeId"),
    }),
    Notification: a.model({
      read_at: a.datetime(),
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
  })
  .authorization((allow) => [allow.authenticated()]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: "userPool",
  },
});
