import { type ClientSchema, a, defineData } from "@aws-amplify/backend";
import { createUser } from "./cognito-admin/create-user/resource";
import { deleteUser } from "./cognito-admin/delete-user/resouce";
import { enableUser } from "./cognito-admin/enable-user/resouce";
import { disableUser } from "./cognito-admin/disable-user/resouce";
import { deleteCategoryOverride } from "./override/delete/delete-category-override/resource";
import { deleteSubcategoryOverride } from "./override/delete/delete-subcategory-override/resource";
import { deleteStaffOverride } from "./override/delete/delete-staff-override/resouce";
import { deleteRoleOverride } from "./override/delete/delete-role-override/resource";
import { deleteAircraftOverride } from "./override/delete/delete-aricraft-override/resource";
import { deleteDocumentOverride } from "./override/delete/delete-document-override/resouce";
import { deleteNoticeDocumentOverride } from "./override/delete/delete-notice-document-override/resource";
import { deleteNoticeOverride } from "./override/delete/delete-notice-override/resource";
import { createStaffOverride } from "./override/create/create-staff-override/resource";
import { createAircraftOverride } from "./override/create/create-aircraft-override/resource";
import { createRoleOverride } from "./override/create/create-role-override/resource";
import { createSubcategoryOverride } from "./override/create/create-subcategory-override/resource";
import { createDocumentOverride } from "./override/create/create-document-override/resource";
import { createNoticeOverride } from "./override/create/create-notice-override/resource";
import { updateRoleStaffOverride } from "./override/update/update-role-staff-override/resource";
import { updateStaffSubcategoryOverride } from "./override/update/update-staff-subcategory-override/resource";
import { updateAircraftStaffOverride } from "./override/update/update-aircraft-staff-override/resource";
import { updateAircraftNoticeOverride } from "./override/update/update-aircraft-notice-override/resource";
import { updateNoticeStaffOverride } from "./override/update/update-notice-staff-override/resource";

const schema = a
  .schema({
    updateNoticeStaffOverride: a
      .mutation()
      .arguments({
        noticeId: a.id().required(),
        staffIds: a.id().required().array(),
        aircraftIds: a.id().required().array(),
        roleIds: a.id().required().array(),
      })
      .handler(a.handler.function(updateNoticeStaffOverride))
      .returns(a.json()),
    updateAircraftNoticeOverride: a
      .mutation()
      .arguments({
        compareKey: a.enum(["NOTICE", "AIRCRAFT"]),
        id: a.id().required(),
        ids: a.id().required().array().required(),
      })
      .handler(a.handler.function(updateAircraftNoticeOverride))
      .returns(a.json()),
    updateAircraftStaffOverride: a
      .mutation()
      .arguments({
        compareKey: a.enum(["STAFF", "AIRCRAFT"]),
        id: a.id().required(),
        ids: a.id().required().array().required(),
      })
      .handler(a.handler.function(updateAircraftStaffOverride))
      .returns(a.json()),
    updateStaffSubcategoryOverride: a
      .mutation()
      .arguments({
        compareKey: a.enum(["STAFF", "SUBCATEGORY"]),
        id: a.id().required(),
        ids: a.id().required().array().required(),
        accessLevels: a.integer().required().array().required(),
      })
      .handler(a.handler.function(updateStaffSubcategoryOverride))
      .returns(a.json()),
    updateRoleStaffOverride: a
      .mutation()
      .arguments({
        compareKey: a.enum(["STAFF", "ROLE"]),
        id: a.id().required(),
        ids: a.id().required().array().required(),
      })
      .handler(a.handler.function(updateRoleStaffOverride))
      .returns(a.json()),
    createNoticeOverride: a
      .mutation()
      .arguments({
        subject: a.string().required(),
        type: a.enum(["Notice_to_Crew", "Safety_notice", "Hazard_report"]),
        status: a.enum(["Draft", "Open", "Pending", "Resolved"]),
        archived: a.boolean().required(),
        details: a.json().required(),
        noticed_at: a.datetime(),
        deadline_at: a.datetime(),
        staffId: a.id().required(),
        recipients: a.id().required().array(),
        aircraft: a.id().required().array(),
        documents: a.string().required().array(),
      })
      .handler(a.handler.function(createNoticeOverride))
      .returns(a.json()),
    createDocumentOverride: a
      .mutation()
      .arguments({
        name: a.string().required(),
        staffId: a.id().required(),
        subcategoryId: a.id().required(),
        archived: a.boolean().required(),
        aircraft: a.id().required().array(),
      })
      .handler(a.handler.function(createDocumentOverride))
      .returns(a.json()),
    createSubcategoryOverride: a
      .mutation()
      .arguments({
        categoryId: a.id().required(),
        name: a.string().required(),
        description: a.string().required(),
        archived: a.boolean().required(),
        staff: a.id().required().array(),
        accessLevels: a.integer().required().array(),
      })
      .handler(a.handler.function(createSubcategoryOverride))
      .returns(a.json()),
    createRoleOverride: a
      .mutation()
      .arguments({
        name: a.string().required(),
        description: a.string().required(),
        archived: a.boolean().required(),
        staff: a.id().required().array(),
      })
      .handler(a.handler.function(createRoleOverride))
      .returns(a.json()),
    createAircraftOverride: a
      .mutation()
      .arguments({
        name: a.string().required(),
        description: a.string().required(),
        archived: a.boolean().required(),
        staff: a.id().required().array(),
      })
      .handler(a.handler.function(createAircraftOverride))
      .returns(a.json()),
    createStaffOverride: a
      .mutation()
      .arguments({
        name: a.string().required(),
        email: a.email().required(),
        archived: a.boolean().required(),
        aircraft: a.id().required().array(),
        roles: a.id().required().array(),
        subcategories: a.id().required().array(),
        accessLevels: a.integer().required().array(),
      })
      .handler(a.handler.function(createStaffOverride))
      .returns(a.json()),
    deleteNoticeOverride: a
      .mutation()
      .arguments({
        noticeId: a.id().required(),
      })
      .handler(a.handler.function(deleteNoticeOverride))
      .returns(a.json()),
    deleteNoticeDocumentOverride: a
      .mutation()
      .arguments({
        noticeDocumentId: a.id().required(),
        noticeDocumentName: a.string().required(),
      })
      .handler(a.handler.function(deleteNoticeDocumentOverride))
      .returns(a.json()),
    deleteDocumentOverride: a
      .mutation()
      .arguments({
        documentId: a.id().required(),
        documentName: a.string().required(),
      })
      .handler(a.handler.function(deleteDocumentOverride))
      .returns(a.json()),
    deleteAircraftOverride: a
      .mutation()
      .arguments({
        aircraftId: a.id().required(),
      })
      .handler(a.handler.function(deleteAircraftOverride))
      .returns(a.json()),
    deleteRoleOverride: a
      .mutation()
      .arguments({
        roleId: a.id().required(),
      })
      .handler(a.handler.function(deleteRoleOverride))
      .returns(a.json()),
    deleteStaffOverride: a
      .mutation()
      .arguments({
        staffId: a.id().required(),
      })
      .handler(a.handler.function(deleteStaffOverride))
      .returns(a.json()),
    deleteSubcategoryOverride: a
      .mutation()
      .arguments({
        subcategoryId: a.id().required(),
      })
      .handler(a.handler.function(deleteSubcategoryOverride))
      .returns(a.json()),
    deleteCategoryOverride: a
      .mutation()
      .arguments({
        categoryId: a.id().required(),
      })
      .handler(a.handler.function(deleteCategoryOverride))
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
      staffId: a.id().required(),
      author: a.belongsTo("Staff", "staffId"),
      recipients: a.hasMany("NoticeStaff", "noticeId"),
      aircraft: a.hasMany("AircraftNotice", "noticeId"),
      documents: a.hasMany("NoticeDocument", "noticeId"),
    }),
NoticeStaff: a
  .model({
    read_at: a.datetime(),
    noticeId: a.id().required(),
    staffId: a.id().required(),
    notice: a.belongsTo("Notice", "noticeId"),
    staff: a.belongsTo("Staff", "staffId"),
  })
  .identifier(["noticeId", "staffId"]),
    NoticeDocument: a.model({
      noticeId: a.id().required(),
      notices: a.belongsTo("Notice", "noticeId"),
      name: a.string().required(),
    }),
  })
  .authorization((allow) => [
    allow.authenticated(),
    allow.resource(deleteCategoryOverride),
    allow.resource(deleteSubcategoryOverride),
    allow.resource(deleteStaffOverride),
    allow.resource(deleteRoleOverride),
    allow.resource(deleteAircraftOverride),
    allow.resource(deleteDocumentOverride),
    allow.resource(deleteNoticeDocumentOverride),
    allow.resource(deleteNoticeOverride),
    allow.resource(createStaffOverride),
    allow.resource(createAircraftOverride),
    allow.resource(createRoleOverride),
    allow.resource(createSubcategoryOverride),
    allow.resource(createDocumentOverride),
    allow.resource(createNoticeOverride),
    allow.resource(updateRoleStaffOverride),
    allow.resource(updateStaffSubcategoryOverride),
    allow.resource(updateAircraftStaffOverride),
    allow.resource(updateAircraftNoticeOverride),
    allow.resource(updateNoticeStaffOverride),
  ]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: "userPool",
  },
});
