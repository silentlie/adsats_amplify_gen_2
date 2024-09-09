/* tslint:disable */
/* eslint-disable */
//  This file was automatically generated and should not be edited.

export type Aircraft = {
  __typename: "Aircraft",
  archived: boolean,
  createdAt: string,
  description?: string | null,
  document?: ModelAircraftDocumentConnection | null,
  id: string,
  name: string,
  notices?: ModelAircraftNoticeConnection | null,
  staff?: ModelAircraftStaffConnection | null,
  updatedAt: string,
};

export type ModelAircraftDocumentConnection = {
  __typename: "ModelAircraftDocumentConnection",
  items:  Array<AircraftDocument | null >,
  nextToken?: string | null,
};

export type AircraftDocument = {
  __typename: "AircraftDocument",
  aircraft?: Aircraft | null,
  aircraftId: string,
  createdAt: string,
  document?: Document | null,
  documentId: string,
  id: string,
  updatedAt: string,
};

export type Document = {
  __typename: "Document",
  aircraft?: ModelAircraftDocumentConnection | null,
  archived: boolean,
  createdAt: string,
  id: string,
  name: string,
  staff?: Staff | null,
  staffId?: string | null,
  subcategory?: Subcategory | null,
  subcategoryId?: string | null,
  updatedAt: string,
};

export type Staff = {
  __typename: "Staff",
  aircraft?: ModelAircraftStaffConnection | null,
  archived: boolean,
  createdAt: string,
  documents?: ModelDocumentConnection | null,
  email: string,
  id: string,
  name: string,
  notices?: ModelNoticeConnection | null,
  notifications?: ModelNoticeStaffConnection | null,
  roles?: ModelRoleStaffConnection | null,
  subcategories?: ModelStaffSubcategoryConnection | null,
  updatedAt: string,
};

export type ModelAircraftStaffConnection = {
  __typename: "ModelAircraftStaffConnection",
  items:  Array<AircraftStaff | null >,
  nextToken?: string | null,
};

export type AircraftStaff = {
  __typename: "AircraftStaff",
  aircraft?: Aircraft | null,
  aircraftId: string,
  createdAt: string,
  id: string,
  staff?: Staff | null,
  staffId: string,
  updatedAt: string,
};

export type ModelDocumentConnection = {
  __typename: "ModelDocumentConnection",
  items:  Array<Document | null >,
  nextToken?: string | null,
};

export type ModelNoticeConnection = {
  __typename: "ModelNoticeConnection",
  items:  Array<Notice | null >,
  nextToken?: string | null,
};

export type Notice = {
  __typename: "Notice",
  aircraft?: ModelAircraftNoticeConnection | null,
  archived: boolean,
  author?: Staff | null,
  createdAt: string,
  deadline_at?: string | null,
  details: string,
  documents?: ModelNoticeDocumentConnection | null,
  id: string,
  noticed_at?: string | null,
  recipients?: ModelNoticeStaffConnection | null,
  staffId?: string | null,
  status?: NoticeStatus | null,
  subject: string,
  type?: NoticeType | null,
  updatedAt: string,
};

export type ModelAircraftNoticeConnection = {
  __typename: "ModelAircraftNoticeConnection",
  items:  Array<AircraftNotice | null >,
  nextToken?: string | null,
};

export type AircraftNotice = {
  __typename: "AircraftNotice",
  aircraft?: Aircraft | null,
  aircraftId: string,
  createdAt: string,
  id: string,
  notice?: Notice | null,
  noticeId: string,
  updatedAt: string,
};

export type ModelNoticeDocumentConnection = {
  __typename: "ModelNoticeDocumentConnection",
  items:  Array<NoticeDocument | null >,
  nextToken?: string | null,
};

export type NoticeDocument = {
  __typename: "NoticeDocument",
  createdAt: string,
  id: string,
  name: string,
  noticeId: string,
  notices?: Notice | null,
  updatedAt: string,
};

export type ModelNoticeStaffConnection = {
  __typename: "ModelNoticeStaffConnection",
  items:  Array<NoticeStaff | null >,
  nextToken?: string | null,
};

export type NoticeStaff = {
  __typename: "NoticeStaff",
  createdAt: string,
  id: string,
  notice?: Notice | null,
  noticeId: string,
  read_at?: string | null,
  staff?: Staff | null,
  staffId: string,
  updatedAt: string,
};

export enum NoticeStatus {
  Draft = "Draft",
  Open = "Open",
  Pending = "Pending",
  Resolved = "Resolved",
}


export enum NoticeType {
  Hazard_report = "Hazard_report",
  Notice_to_Crew = "Notice_to_Crew",
  Safety_notice = "Safety_notice",
}


export type ModelRoleStaffConnection = {
  __typename: "ModelRoleStaffConnection",
  items:  Array<RoleStaff | null >,
  nextToken?: string | null,
};

export type RoleStaff = {
  __typename: "RoleStaff",
  createdAt: string,
  id: string,
  role?: Role | null,
  roleId: string,
  staff?: Staff | null,
  staffId: string,
  updatedAt: string,
};

export type Role = {
  __typename: "Role",
  archived: boolean,
  createdAt: string,
  description?: string | null,
  id: string,
  name: string,
  staff?: ModelRoleStaffConnection | null,
  updatedAt: string,
};

export type ModelStaffSubcategoryConnection = {
  __typename: "ModelStaffSubcategoryConnection",
  items:  Array<StaffSubcategory | null >,
  nextToken?: string | null,
};

export type StaffSubcategory = {
  __typename: "StaffSubcategory",
  accessLevel: number,
  createdAt: string,
  id: string,
  staff?: Staff | null,
  staffId: string,
  subcategory?: Subcategory | null,
  subcategoryId: string,
  updatedAt: string,
};

export type Subcategory = {
  __typename: "Subcategory",
  archived: boolean,
  category?: Category | null,
  categoryId: string,
  createdAt: string,
  description?: string | null,
  documents?: ModelDocumentConnection | null,
  id: string,
  name: string,
  staff?: ModelStaffSubcategoryConnection | null,
  updatedAt: string,
};

export type Category = {
  __typename: "Category",
  archived: boolean,
  createdAt: string,
  description?: string | null,
  id: string,
  name: string,
  subcategories?: ModelSubcategoryConnection | null,
  updatedAt: string,
};

export type ModelSubcategoryConnection = {
  __typename: "ModelSubcategoryConnection",
  items:  Array<Subcategory | null >,
  nextToken?: string | null,
};

export type ModelAircraftFilterInput = {
  and?: Array< ModelAircraftFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelAircraftFilterInput | null,
  or?: Array< ModelAircraftFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelBooleanInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  eq?: boolean | null,
  ne?: boolean | null,
};

export enum ModelAttributeTypes {
  _null = "_null",
  binary = "binary",
  binarySet = "binarySet",
  bool = "bool",
  list = "list",
  map = "map",
  number = "number",
  numberSet = "numberSet",
  string = "string",
  stringSet = "stringSet",
}


export type ModelStringInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  size?: ModelSizeInput | null,
};

export type ModelSizeInput = {
  between?: Array< number | null > | null,
  eq?: number | null,
  ge?: number | null,
  gt?: number | null,
  le?: number | null,
  lt?: number | null,
  ne?: number | null,
};

export type ModelIDInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  size?: ModelSizeInput | null,
};

export type ModelAircraftConnection = {
  __typename: "ModelAircraftConnection",
  items:  Array<Aircraft | null >,
  nextToken?: string | null,
};

export type ModelAircraftDocumentFilterInput = {
  aircraftId?: ModelIDInput | null,
  and?: Array< ModelAircraftDocumentFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  documentId?: ModelIDInput | null,
  id?: ModelIDInput | null,
  not?: ModelAircraftDocumentFilterInput | null,
  or?: Array< ModelAircraftDocumentFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelAircraftNoticeFilterInput = {
  aircraftId?: ModelIDInput | null,
  and?: Array< ModelAircraftNoticeFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelAircraftNoticeFilterInput | null,
  noticeId?: ModelIDInput | null,
  or?: Array< ModelAircraftNoticeFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelAircraftStaffFilterInput = {
  aircraftId?: ModelIDInput | null,
  and?: Array< ModelAircraftStaffFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelAircraftStaffFilterInput | null,
  or?: Array< ModelAircraftStaffFilterInput | null > | null,
  staffId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelCategoryFilterInput = {
  and?: Array< ModelCategoryFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelCategoryFilterInput | null,
  or?: Array< ModelCategoryFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelCategoryConnection = {
  __typename: "ModelCategoryConnection",
  items:  Array<Category | null >,
  nextToken?: string | null,
};

export type ModelDocumentFilterInput = {
  and?: Array< ModelDocumentFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelDocumentFilterInput | null,
  or?: Array< ModelDocumentFilterInput | null > | null,
  staffId?: ModelIDInput | null,
  subcategoryId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelNoticeDocumentFilterInput = {
  and?: Array< ModelNoticeDocumentFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelNoticeDocumentFilterInput | null,
  noticeId?: ModelIDInput | null,
  or?: Array< ModelNoticeDocumentFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelNoticeStaffFilterInput = {
  and?: Array< ModelNoticeStaffFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelNoticeStaffFilterInput | null,
  noticeId?: ModelIDInput | null,
  or?: Array< ModelNoticeStaffFilterInput | null > | null,
  read_at?: ModelStringInput | null,
  staffId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelNoticeFilterInput = {
  and?: Array< ModelNoticeFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  deadline_at?: ModelStringInput | null,
  details?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelNoticeFilterInput | null,
  noticed_at?: ModelStringInput | null,
  or?: Array< ModelNoticeFilterInput | null > | null,
  staffId?: ModelIDInput | null,
  status?: ModelNoticeStatusInput | null,
  subject?: ModelStringInput | null,
  type?: ModelNoticeTypeInput | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelNoticeStatusInput = {
  eq?: NoticeStatus | null,
  ne?: NoticeStatus | null,
};

export type ModelNoticeTypeInput = {
  eq?: NoticeType | null,
  ne?: NoticeType | null,
};

export type ModelRoleStaffFilterInput = {
  and?: Array< ModelRoleStaffFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelRoleStaffFilterInput | null,
  or?: Array< ModelRoleStaffFilterInput | null > | null,
  roleId?: ModelIDInput | null,
  staffId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelRoleFilterInput = {
  and?: Array< ModelRoleFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelRoleFilterInput | null,
  or?: Array< ModelRoleFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelRoleConnection = {
  __typename: "ModelRoleConnection",
  items:  Array<Role | null >,
  nextToken?: string | null,
};

export type ModelStaffFilterInput = {
  and?: Array< ModelStaffFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  email?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelStaffFilterInput | null,
  or?: Array< ModelStaffFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export enum ModelSortDirection {
  ASC = "ASC",
  DESC = "DESC",
}


export type ModelStaffConnection = {
  __typename: "ModelStaffConnection",
  items:  Array<Staff | null >,
  nextToken?: string | null,
};

export type ModelStaffSubcategoryFilterInput = {
  accessLevel?: ModelIntInput | null,
  and?: Array< ModelStaffSubcategoryFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelStaffSubcategoryFilterInput | null,
  or?: Array< ModelStaffSubcategoryFilterInput | null > | null,
  staffId?: ModelIDInput | null,
  subcategoryId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelIntInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  between?: Array< number | null > | null,
  eq?: number | null,
  ge?: number | null,
  gt?: number | null,
  le?: number | null,
  lt?: number | null,
  ne?: number | null,
};

export type ModelSubcategoryFilterInput = {
  and?: Array< ModelSubcategoryFilterInput | null > | null,
  archived?: ModelBooleanInput | null,
  categoryId?: ModelIDInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelSubcategoryFilterInput | null,
  or?: Array< ModelSubcategoryFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelAircraftConditionInput = {
  and?: Array< ModelAircraftConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelAircraftConditionInput | null,
  or?: Array< ModelAircraftConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateAircraftInput = {
  archived: boolean,
  description?: string | null,
  id?: string | null,
  name: string,
};

export type ModelAircraftDocumentConditionInput = {
  aircraftId?: ModelIDInput | null,
  and?: Array< ModelAircraftDocumentConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  documentId?: ModelIDInput | null,
  not?: ModelAircraftDocumentConditionInput | null,
  or?: Array< ModelAircraftDocumentConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateAircraftDocumentInput = {
  aircraftId: string,
  documentId: string,
  id?: string | null,
};

export type ModelAircraftNoticeConditionInput = {
  aircraftId?: ModelIDInput | null,
  and?: Array< ModelAircraftNoticeConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  not?: ModelAircraftNoticeConditionInput | null,
  noticeId?: ModelIDInput | null,
  or?: Array< ModelAircraftNoticeConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateAircraftNoticeInput = {
  aircraftId: string,
  id?: string | null,
  noticeId: string,
};

export type ModelAircraftStaffConditionInput = {
  aircraftId?: ModelIDInput | null,
  and?: Array< ModelAircraftStaffConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  not?: ModelAircraftStaffConditionInput | null,
  or?: Array< ModelAircraftStaffConditionInput | null > | null,
  staffId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateAircraftStaffInput = {
  aircraftId: string,
  id?: string | null,
  staffId: string,
};

export type ModelCategoryConditionInput = {
  and?: Array< ModelCategoryConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelCategoryConditionInput | null,
  or?: Array< ModelCategoryConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateCategoryInput = {
  archived: boolean,
  description?: string | null,
  id?: string | null,
  name: string,
};

export type ModelDocumentConditionInput = {
  and?: Array< ModelDocumentConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelDocumentConditionInput | null,
  or?: Array< ModelDocumentConditionInput | null > | null,
  staffId?: ModelIDInput | null,
  subcategoryId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateDocumentInput = {
  archived: boolean,
  id?: string | null,
  name: string,
  staffId?: string | null,
  subcategoryId?: string | null,
};

export type ModelNoticeConditionInput = {
  and?: Array< ModelNoticeConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  deadline_at?: ModelStringInput | null,
  details?: ModelStringInput | null,
  not?: ModelNoticeConditionInput | null,
  noticed_at?: ModelStringInput | null,
  or?: Array< ModelNoticeConditionInput | null > | null,
  staffId?: ModelIDInput | null,
  status?: ModelNoticeStatusInput | null,
  subject?: ModelStringInput | null,
  type?: ModelNoticeTypeInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateNoticeInput = {
  archived: boolean,
  deadline_at?: string | null,
  details: string,
  id?: string | null,
  noticed_at?: string | null,
  staffId?: string | null,
  status?: NoticeStatus | null,
  subject: string,
  type?: NoticeType | null,
};

export type ModelNoticeDocumentConditionInput = {
  and?: Array< ModelNoticeDocumentConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelNoticeDocumentConditionInput | null,
  noticeId?: ModelIDInput | null,
  or?: Array< ModelNoticeDocumentConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateNoticeDocumentInput = {
  id?: string | null,
  name: string,
  noticeId: string,
};

export type ModelNoticeStaffConditionInput = {
  and?: Array< ModelNoticeStaffConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  not?: ModelNoticeStaffConditionInput | null,
  noticeId?: ModelIDInput | null,
  or?: Array< ModelNoticeStaffConditionInput | null > | null,
  read_at?: ModelStringInput | null,
  staffId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateNoticeStaffInput = {
  id?: string | null,
  noticeId: string,
  read_at?: string | null,
  staffId: string,
};

export type ModelRoleConditionInput = {
  and?: Array< ModelRoleConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelRoleConditionInput | null,
  or?: Array< ModelRoleConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateRoleInput = {
  archived: boolean,
  description?: string | null,
  id?: string | null,
  name: string,
};

export type ModelRoleStaffConditionInput = {
  and?: Array< ModelRoleStaffConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  not?: ModelRoleStaffConditionInput | null,
  or?: Array< ModelRoleStaffConditionInput | null > | null,
  roleId?: ModelIDInput | null,
  staffId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateRoleStaffInput = {
  id?: string | null,
  roleId: string,
  staffId: string,
};

export type ModelStaffConditionInput = {
  and?: Array< ModelStaffConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  createdAt?: ModelStringInput | null,
  email?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelStaffConditionInput | null,
  or?: Array< ModelStaffConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateStaffInput = {
  archived: boolean,
  email: string,
  id?: string | null,
  name: string,
};

export type ModelStaffSubcategoryConditionInput = {
  accessLevel?: ModelIntInput | null,
  and?: Array< ModelStaffSubcategoryConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  not?: ModelStaffSubcategoryConditionInput | null,
  or?: Array< ModelStaffSubcategoryConditionInput | null > | null,
  staffId?: ModelIDInput | null,
  subcategoryId?: ModelIDInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateStaffSubcategoryInput = {
  accessLevel: number,
  id?: string | null,
  staffId: string,
  subcategoryId: string,
};

export type ModelSubcategoryConditionInput = {
  and?: Array< ModelSubcategoryConditionInput | null > | null,
  archived?: ModelBooleanInput | null,
  categoryId?: ModelIDInput | null,
  createdAt?: ModelStringInput | null,
  description?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelSubcategoryConditionInput | null,
  or?: Array< ModelSubcategoryConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateSubcategoryInput = {
  archived: boolean,
  categoryId: string,
  description?: string | null,
  id?: string | null,
  name: string,
};

export type DeleteAircraftInput = {
  id: string,
};

export type DeleteAircraftDocumentInput = {
  id: string,
};

export type DeleteAircraftNoticeInput = {
  id: string,
};

export type DeleteAircraftStaffInput = {
  id: string,
};

export type DeleteCategoryInput = {
  id: string,
};

export type DeleteDocumentInput = {
  id: string,
};

export type DeleteNoticeInput = {
  id: string,
};

export type DeleteNoticeDocumentInput = {
  id: string,
};

export type DeleteNoticeStaffInput = {
  id: string,
};

export type DeleteRoleInput = {
  id: string,
};

export type DeleteRoleStaffInput = {
  id: string,
};

export type DeleteStaffInput = {
  id: string,
};

export type DeleteStaffSubcategoryInput = {
  id: string,
};

export type DeleteSubcategoryInput = {
  id: string,
};

export type UpdateAircraftInput = {
  archived?: boolean | null,
  description?: string | null,
  id: string,
  name?: string | null,
};

export type UpdateAircraftDocumentInput = {
  aircraftId?: string | null,
  documentId?: string | null,
  id: string,
};

export type UpdateAircraftNoticeInput = {
  aircraftId?: string | null,
  id: string,
  noticeId?: string | null,
};

export type UpdateAircraftStaffInput = {
  aircraftId?: string | null,
  id: string,
  staffId?: string | null,
};

export type UpdateCategoryInput = {
  archived?: boolean | null,
  description?: string | null,
  id: string,
  name?: string | null,
};

export type UpdateDocumentInput = {
  archived?: boolean | null,
  id: string,
  name?: string | null,
  staffId?: string | null,
  subcategoryId?: string | null,
};

export type UpdateNoticeInput = {
  archived?: boolean | null,
  deadline_at?: string | null,
  details?: string | null,
  id: string,
  noticed_at?: string | null,
  staffId?: string | null,
  status?: NoticeStatus | null,
  subject?: string | null,
  type?: NoticeType | null,
};

export type UpdateNoticeDocumentInput = {
  id: string,
  name?: string | null,
  noticeId?: string | null,
};

export type UpdateNoticeStaffInput = {
  id: string,
  noticeId?: string | null,
  read_at?: string | null,
  staffId?: string | null,
};

export type UpdateRoleInput = {
  archived?: boolean | null,
  description?: string | null,
  id: string,
  name?: string | null,
};

export type UpdateRoleStaffInput = {
  id: string,
  roleId?: string | null,
  staffId?: string | null,
};

export type UpdateStaffInput = {
  archived?: boolean | null,
  email?: string | null,
  id: string,
  name?: string | null,
};

export type UpdateStaffSubcategoryInput = {
  accessLevel?: number | null,
  id: string,
  staffId?: string | null,
  subcategoryId?: string | null,
};

export type UpdateSubcategoryInput = {
  archived?: boolean | null,
  categoryId?: string | null,
  description?: string | null,
  id: string,
  name?: string | null,
};

export type ModelSubscriptionAircraftFilterInput = {
  and?: Array< ModelSubscriptionAircraftFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  description?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionAircraftFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionBooleanInput = {
  eq?: boolean | null,
  ne?: boolean | null,
};

export type ModelSubscriptionStringInput = {
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  in?: Array< string | null > | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  notIn?: Array< string | null > | null,
};

export type ModelSubscriptionIDInput = {
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  in?: Array< string | null > | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  notIn?: Array< string | null > | null,
};

export type ModelSubscriptionAircraftDocumentFilterInput = {
  aircraftId?: ModelSubscriptionIDInput | null,
  and?: Array< ModelSubscriptionAircraftDocumentFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  documentId?: ModelSubscriptionIDInput | null,
  id?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionAircraftDocumentFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionAircraftNoticeFilterInput = {
  aircraftId?: ModelSubscriptionIDInput | null,
  and?: Array< ModelSubscriptionAircraftNoticeFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  noticeId?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionAircraftNoticeFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionAircraftStaffFilterInput = {
  aircraftId?: ModelSubscriptionIDInput | null,
  and?: Array< ModelSubscriptionAircraftStaffFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionAircraftStaffFilterInput | null > | null,
  staffId?: ModelSubscriptionIDInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionCategoryFilterInput = {
  and?: Array< ModelSubscriptionCategoryFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  description?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionCategoryFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionDocumentFilterInput = {
  and?: Array< ModelSubscriptionDocumentFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionDocumentFilterInput | null > | null,
  staffId?: ModelSubscriptionIDInput | null,
  subcategoryId?: ModelSubscriptionIDInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionNoticeFilterInput = {
  and?: Array< ModelSubscriptionNoticeFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  deadline_at?: ModelSubscriptionStringInput | null,
  details?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  noticed_at?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionNoticeFilterInput | null > | null,
  staffId?: ModelSubscriptionIDInput | null,
  status?: ModelSubscriptionStringInput | null,
  subject?: ModelSubscriptionStringInput | null,
  type?: ModelSubscriptionStringInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionNoticeDocumentFilterInput = {
  and?: Array< ModelSubscriptionNoticeDocumentFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  noticeId?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionNoticeDocumentFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionNoticeStaffFilterInput = {
  and?: Array< ModelSubscriptionNoticeStaffFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  noticeId?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionNoticeStaffFilterInput | null > | null,
  read_at?: ModelSubscriptionStringInput | null,
  staffId?: ModelSubscriptionIDInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionRoleFilterInput = {
  and?: Array< ModelSubscriptionRoleFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  description?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionRoleFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionRoleStaffFilterInput = {
  and?: Array< ModelSubscriptionRoleStaffFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionRoleStaffFilterInput | null > | null,
  roleId?: ModelSubscriptionIDInput | null,
  staffId?: ModelSubscriptionIDInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionStaffFilterInput = {
  and?: Array< ModelSubscriptionStaffFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  email?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionStaffFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionStaffSubcategoryFilterInput = {
  accessLevel?: ModelSubscriptionIntInput | null,
  and?: Array< ModelSubscriptionStaffSubcategoryFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionStaffSubcategoryFilterInput | null > | null,
  staffId?: ModelSubscriptionIDInput | null,
  subcategoryId?: ModelSubscriptionIDInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionIntInput = {
  between?: Array< number | null > | null,
  eq?: number | null,
  ge?: number | null,
  gt?: number | null,
  in?: Array< number | null > | null,
  le?: number | null,
  lt?: number | null,
  ne?: number | null,
  notIn?: Array< number | null > | null,
};

export type ModelSubscriptionSubcategoryFilterInput = {
  and?: Array< ModelSubscriptionSubcategoryFilterInput | null > | null,
  archived?: ModelSubscriptionBooleanInput | null,
  categoryId?: ModelSubscriptionIDInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  description?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionSubcategoryFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type GetAircraftQueryVariables = {
  id: string,
};

export type GetAircraftQuery = {
  getAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type GetAircraftDocumentQueryVariables = {
  id: string,
};

export type GetAircraftDocumentQuery = {
  getAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type GetAircraftNoticeQueryVariables = {
  id: string,
};

export type GetAircraftNoticeQuery = {
  getAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type GetAircraftStaffQueryVariables = {
  id: string,
};

export type GetAircraftStaffQuery = {
  getAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type GetCategoryQueryVariables = {
  id: string,
};

export type GetCategoryQuery = {
  getCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type GetDocumentQueryVariables = {
  id: string,
};

export type GetDocumentQuery = {
  getDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type GetNoticeQueryVariables = {
  id: string,
};

export type GetNoticeQuery = {
  getNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type GetNoticeDocumentQueryVariables = {
  id: string,
};

export type GetNoticeDocumentQuery = {
  getNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type GetNoticeStaffQueryVariables = {
  id: string,
};

export type GetNoticeStaffQuery = {
  getNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type GetRoleQueryVariables = {
  id: string,
};

export type GetRoleQuery = {
  getRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type GetRoleStaffQueryVariables = {
  id: string,
};

export type GetRoleStaffQuery = {
  getRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type GetStaffQueryVariables = {
  id: string,
};

export type GetStaffQuery = {
  getStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type GetStaffSubcategoryQueryVariables = {
  id: string,
};

export type GetStaffSubcategoryQuery = {
  getStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type GetSubcategoryQueryVariables = {
  id: string,
};

export type GetSubcategoryQuery = {
  getSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type ListAircraftQueryVariables = {
  filter?: ModelAircraftFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListAircraftQuery = {
  listAircraft?:  {
    __typename: "ModelAircraftConnection",
    items:  Array< {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListAircraftDocumentsQueryVariables = {
  filter?: ModelAircraftDocumentFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListAircraftDocumentsQuery = {
  listAircraftDocuments?:  {
    __typename: "ModelAircraftDocumentConnection",
    items:  Array< {
      __typename: "AircraftDocument",
      aircraftId: string,
      createdAt: string,
      documentId: string,
      id: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListAircraftNoticesQueryVariables = {
  filter?: ModelAircraftNoticeFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListAircraftNoticesQuery = {
  listAircraftNotices?:  {
    __typename: "ModelAircraftNoticeConnection",
    items:  Array< {
      __typename: "AircraftNotice",
      aircraftId: string,
      createdAt: string,
      id: string,
      noticeId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListAircraftStaffsQueryVariables = {
  filter?: ModelAircraftStaffFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListAircraftStaffsQuery = {
  listAircraftStaffs?:  {
    __typename: "ModelAircraftStaffConnection",
    items:  Array< {
      __typename: "AircraftStaff",
      aircraftId: string,
      createdAt: string,
      id: string,
      staffId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListCategoriesQueryVariables = {
  filter?: ModelCategoryFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListCategoriesQuery = {
  listCategories?:  {
    __typename: "ModelCategoryConnection",
    items:  Array< {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListDocumentsQueryVariables = {
  filter?: ModelDocumentFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListDocumentsQuery = {
  listDocuments?:  {
    __typename: "ModelDocumentConnection",
    items:  Array< {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListNoticeDocumentsQueryVariables = {
  filter?: ModelNoticeDocumentFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListNoticeDocumentsQuery = {
  listNoticeDocuments?:  {
    __typename: "ModelNoticeDocumentConnection",
    items:  Array< {
      __typename: "NoticeDocument",
      createdAt: string,
      id: string,
      name: string,
      noticeId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListNoticeStaffsQueryVariables = {
  filter?: ModelNoticeStaffFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListNoticeStaffsQuery = {
  listNoticeStaffs?:  {
    __typename: "ModelNoticeStaffConnection",
    items:  Array< {
      __typename: "NoticeStaff",
      createdAt: string,
      id: string,
      noticeId: string,
      read_at?: string | null,
      staffId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListNoticesQueryVariables = {
  filter?: ModelNoticeFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListNoticesQuery = {
  listNotices?:  {
    __typename: "ModelNoticeConnection",
    items:  Array< {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListRoleStaffsQueryVariables = {
  filter?: ModelRoleStaffFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListRoleStaffsQuery = {
  listRoleStaffs?:  {
    __typename: "ModelRoleStaffConnection",
    items:  Array< {
      __typename: "RoleStaff",
      createdAt: string,
      id: string,
      roleId: string,
      staffId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListRolesQueryVariables = {
  filter?: ModelRoleFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListRolesQuery = {
  listRoles?:  {
    __typename: "ModelRoleConnection",
    items:  Array< {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListStaffQueryVariables = {
  filter?: ModelStaffFilterInput | null,
  id?: string | null,
  limit?: number | null,
  nextToken?: string | null,
  sortDirection?: ModelSortDirection | null,
};

export type ListStaffQuery = {
  listStaff?:  {
    __typename: "ModelStaffConnection",
    items:  Array< {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListStaffSubcategoriesQueryVariables = {
  filter?: ModelStaffSubcategoryFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListStaffSubcategoriesQuery = {
  listStaffSubcategories?:  {
    __typename: "ModelStaffSubcategoryConnection",
    items:  Array< {
      __typename: "StaffSubcategory",
      accessLevel: number,
      createdAt: string,
      id: string,
      staffId: string,
      subcategoryId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListSubcategoriesQueryVariables = {
  filter?: ModelSubcategoryFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
};

export type ListSubcategoriesQuery = {
  listSubcategories?:  {
    __typename: "ModelSubcategoryConnection",
    items:  Array< {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListUsersQueryVariables = {
  attributesToGet?: Array< string > | null,
  filter?: string | null,
  limit?: number | null,
  paginationToken?: string | null,
};

export type ListUsersQuery = {
  listUsers?: string | null,
};

export type CreateAircraftMutationVariables = {
  condition?: ModelAircraftConditionInput | null,
  input: CreateAircraftInput,
};

export type CreateAircraftMutation = {
  createAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type CreateAircraftDocumentMutationVariables = {
  condition?: ModelAircraftDocumentConditionInput | null,
  input: CreateAircraftDocumentInput,
};

export type CreateAircraftDocumentMutation = {
  createAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type CreateAircraftNoticeMutationVariables = {
  condition?: ModelAircraftNoticeConditionInput | null,
  input: CreateAircraftNoticeInput,
};

export type CreateAircraftNoticeMutation = {
  createAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type CreateAircraftStaffMutationVariables = {
  condition?: ModelAircraftStaffConditionInput | null,
  input: CreateAircraftStaffInput,
};

export type CreateAircraftStaffMutation = {
  createAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type CreateCategoryMutationVariables = {
  condition?: ModelCategoryConditionInput | null,
  input: CreateCategoryInput,
};

export type CreateCategoryMutation = {
  createCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type CreateDocumentMutationVariables = {
  condition?: ModelDocumentConditionInput | null,
  input: CreateDocumentInput,
};

export type CreateDocumentMutation = {
  createDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type CreateNoticeMutationVariables = {
  condition?: ModelNoticeConditionInput | null,
  input: CreateNoticeInput,
};

export type CreateNoticeMutation = {
  createNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type CreateNoticeDocumentMutationVariables = {
  condition?: ModelNoticeDocumentConditionInput | null,
  input: CreateNoticeDocumentInput,
};

export type CreateNoticeDocumentMutation = {
  createNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type CreateNoticeStaffMutationVariables = {
  condition?: ModelNoticeStaffConditionInput | null,
  input: CreateNoticeStaffInput,
};

export type CreateNoticeStaffMutation = {
  createNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type CreateRoleMutationVariables = {
  condition?: ModelRoleConditionInput | null,
  input: CreateRoleInput,
};

export type CreateRoleMutation = {
  createRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type CreateRoleStaffMutationVariables = {
  condition?: ModelRoleStaffConditionInput | null,
  input: CreateRoleStaffInput,
};

export type CreateRoleStaffMutation = {
  createRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type CreateStaffMutationVariables = {
  condition?: ModelStaffConditionInput | null,
  input: CreateStaffInput,
};

export type CreateStaffMutation = {
  createStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type CreateStaffSubcategoryMutationVariables = {
  condition?: ModelStaffSubcategoryConditionInput | null,
  input: CreateStaffSubcategoryInput,
};

export type CreateStaffSubcategoryMutation = {
  createStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type CreateSubcategoryMutationVariables = {
  condition?: ModelSubcategoryConditionInput | null,
  input: CreateSubcategoryInput,
};

export type CreateSubcategoryMutation = {
  createSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type CreateUserMutationVariables = {
  email: string,
  name: string,
  temporaryPassword: string,
};

export type CreateUserMutation = {
  createUser?: string | null,
};

export type DeleteAircraftMutationVariables = {
  condition?: ModelAircraftConditionInput | null,
  input: DeleteAircraftInput,
};

export type DeleteAircraftMutation = {
  deleteAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type DeleteAircraftDocumentMutationVariables = {
  condition?: ModelAircraftDocumentConditionInput | null,
  input: DeleteAircraftDocumentInput,
};

export type DeleteAircraftDocumentMutation = {
  deleteAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type DeleteAircraftNoticeMutationVariables = {
  condition?: ModelAircraftNoticeConditionInput | null,
  input: DeleteAircraftNoticeInput,
};

export type DeleteAircraftNoticeMutation = {
  deleteAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type DeleteAircraftStaffMutationVariables = {
  condition?: ModelAircraftStaffConditionInput | null,
  input: DeleteAircraftStaffInput,
};

export type DeleteAircraftStaffMutation = {
  deleteAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type DeleteCategoryMutationVariables = {
  condition?: ModelCategoryConditionInput | null,
  input: DeleteCategoryInput,
};

export type DeleteCategoryMutation = {
  deleteCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type DeleteCategoryLambdaMutationVariables = {
  categoryId: string,
};

export type DeleteCategoryLambdaMutation = {
  deleteCategoryLambda?: string | null,
};

export type DeleteDocumentMutationVariables = {
  condition?: ModelDocumentConditionInput | null,
  input: DeleteDocumentInput,
};

export type DeleteDocumentMutation = {
  deleteDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type DeleteNoticeMutationVariables = {
  condition?: ModelNoticeConditionInput | null,
  input: DeleteNoticeInput,
};

export type DeleteNoticeMutation = {
  deleteNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type DeleteNoticeDocumentMutationVariables = {
  condition?: ModelNoticeDocumentConditionInput | null,
  input: DeleteNoticeDocumentInput,
};

export type DeleteNoticeDocumentMutation = {
  deleteNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type DeleteNoticeStaffMutationVariables = {
  condition?: ModelNoticeStaffConditionInput | null,
  input: DeleteNoticeStaffInput,
};

export type DeleteNoticeStaffMutation = {
  deleteNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type DeleteRoleMutationVariables = {
  condition?: ModelRoleConditionInput | null,
  input: DeleteRoleInput,
};

export type DeleteRoleMutation = {
  deleteRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type DeleteRoleStaffMutationVariables = {
  condition?: ModelRoleStaffConditionInput | null,
  input: DeleteRoleStaffInput,
};

export type DeleteRoleStaffMutation = {
  deleteRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type DeleteStaffMutationVariables = {
  condition?: ModelStaffConditionInput | null,
  input: DeleteStaffInput,
};

export type DeleteStaffMutation = {
  deleteStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type DeleteStaffSubcategoryMutationVariables = {
  condition?: ModelStaffSubcategoryConditionInput | null,
  input: DeleteStaffSubcategoryInput,
};

export type DeleteStaffSubcategoryMutation = {
  deleteStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type DeleteSubcategoryMutationVariables = {
  condition?: ModelSubcategoryConditionInput | null,
  input: DeleteSubcategoryInput,
};

export type DeleteSubcategoryMutation = {
  deleteSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type DeleteUserMutationVariables = {
  id: string,
};

export type DeleteUserMutation = {
  deleteUser?: string | null,
};

export type DisableUserMutationVariables = {
  id: string,
};

export type DisableUserMutation = {
  disableUser?: string | null,
};

export type EnableUserMutationVariables = {
  id: string,
};

export type EnableUserMutation = {
  enableUser?: string | null,
};

export type UpdateAircraftMutationVariables = {
  condition?: ModelAircraftConditionInput | null,
  input: UpdateAircraftInput,
};

export type UpdateAircraftMutation = {
  updateAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type UpdateAircraftDocumentMutationVariables = {
  condition?: ModelAircraftDocumentConditionInput | null,
  input: UpdateAircraftDocumentInput,
};

export type UpdateAircraftDocumentMutation = {
  updateAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type UpdateAircraftNoticeMutationVariables = {
  condition?: ModelAircraftNoticeConditionInput | null,
  input: UpdateAircraftNoticeInput,
};

export type UpdateAircraftNoticeMutation = {
  updateAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type UpdateAircraftStaffMutationVariables = {
  condition?: ModelAircraftStaffConditionInput | null,
  input: UpdateAircraftStaffInput,
};

export type UpdateAircraftStaffMutation = {
  updateAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type UpdateCategoryMutationVariables = {
  condition?: ModelCategoryConditionInput | null,
  input: UpdateCategoryInput,
};

export type UpdateCategoryMutation = {
  updateCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type UpdateDocumentMutationVariables = {
  condition?: ModelDocumentConditionInput | null,
  input: UpdateDocumentInput,
};

export type UpdateDocumentMutation = {
  updateDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type UpdateNoticeMutationVariables = {
  condition?: ModelNoticeConditionInput | null,
  input: UpdateNoticeInput,
};

export type UpdateNoticeMutation = {
  updateNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type UpdateNoticeDocumentMutationVariables = {
  condition?: ModelNoticeDocumentConditionInput | null,
  input: UpdateNoticeDocumentInput,
};

export type UpdateNoticeDocumentMutation = {
  updateNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type UpdateNoticeStaffMutationVariables = {
  condition?: ModelNoticeStaffConditionInput | null,
  input: UpdateNoticeStaffInput,
};

export type UpdateNoticeStaffMutation = {
  updateNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type UpdateRoleMutationVariables = {
  condition?: ModelRoleConditionInput | null,
  input: UpdateRoleInput,
};

export type UpdateRoleMutation = {
  updateRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type UpdateRoleStaffMutationVariables = {
  condition?: ModelRoleStaffConditionInput | null,
  input: UpdateRoleStaffInput,
};

export type UpdateRoleStaffMutation = {
  updateRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type UpdateStaffMutationVariables = {
  condition?: ModelStaffConditionInput | null,
  input: UpdateStaffInput,
};

export type UpdateStaffMutation = {
  updateStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type UpdateStaffSubcategoryMutationVariables = {
  condition?: ModelStaffSubcategoryConditionInput | null,
  input: UpdateStaffSubcategoryInput,
};

export type UpdateStaffSubcategoryMutation = {
  updateStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type UpdateSubcategoryMutationVariables = {
  condition?: ModelSubcategoryConditionInput | null,
  input: UpdateSubcategoryInput,
};

export type UpdateSubcategoryMutation = {
  updateSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnCreateAircraftSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftFilterInput | null,
};

export type OnCreateAircraftSubscription = {
  onCreateAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnCreateAircraftDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftDocumentFilterInput | null,
};

export type OnCreateAircraftDocumentSubscription = {
  onCreateAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnCreateAircraftNoticeSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftNoticeFilterInput | null,
};

export type OnCreateAircraftNoticeSubscription = {
  onCreateAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateAircraftStaffSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftStaffFilterInput | null,
};

export type OnCreateAircraftStaffSubscription = {
  onCreateAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateCategorySubscriptionVariables = {
  filter?: ModelSubscriptionCategoryFilterInput | null,
};

export type OnCreateCategorySubscription = {
  onCreateCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnCreateDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionDocumentFilterInput | null,
};

export type OnCreateDocumentSubscription = {
  onCreateDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type OnCreateNoticeSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeFilterInput | null,
};

export type OnCreateNoticeSubscription = {
  onCreateNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type OnCreateNoticeDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeDocumentFilterInput | null,
};

export type OnCreateNoticeDocumentSubscription = {
  onCreateNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnCreateNoticeStaffSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeStaffFilterInput | null,
};

export type OnCreateNoticeStaffSubscription = {
  onCreateNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateRoleSubscriptionVariables = {
  filter?: ModelSubscriptionRoleFilterInput | null,
};

export type OnCreateRoleSubscription = {
  onCreateRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnCreateRoleStaffSubscriptionVariables = {
  filter?: ModelSubscriptionRoleStaffFilterInput | null,
};

export type OnCreateRoleStaffSubscription = {
  onCreateRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateStaffSubscriptionVariables = {
  filter?: ModelSubscriptionStaffFilterInput | null,
};

export type OnCreateStaffSubscription = {
  onCreateStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnCreateStaffSubcategorySubscriptionVariables = {
  filter?: ModelSubscriptionStaffSubcategoryFilterInput | null,
};

export type OnCreateStaffSubcategorySubscription = {
  onCreateStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateSubcategorySubscriptionVariables = {
  filter?: ModelSubscriptionSubcategoryFilterInput | null,
};

export type OnCreateSubcategorySubscription = {
  onCreateSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteAircraftSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftFilterInput | null,
};

export type OnDeleteAircraftSubscription = {
  onDeleteAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteAircraftDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftDocumentFilterInput | null,
};

export type OnDeleteAircraftDocumentSubscription = {
  onDeleteAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteAircraftNoticeSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftNoticeFilterInput | null,
};

export type OnDeleteAircraftNoticeSubscription = {
  onDeleteAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteAircraftStaffSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftStaffFilterInput | null,
};

export type OnDeleteAircraftStaffSubscription = {
  onDeleteAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteCategorySubscriptionVariables = {
  filter?: ModelSubscriptionCategoryFilterInput | null,
};

export type OnDeleteCategorySubscription = {
  onDeleteCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionDocumentFilterInput | null,
};

export type OnDeleteDocumentSubscription = {
  onDeleteDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteNoticeSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeFilterInput | null,
};

export type OnDeleteNoticeSubscription = {
  onDeleteNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteNoticeDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeDocumentFilterInput | null,
};

export type OnDeleteNoticeDocumentSubscription = {
  onDeleteNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteNoticeStaffSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeStaffFilterInput | null,
};

export type OnDeleteNoticeStaffSubscription = {
  onDeleteNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteRoleSubscriptionVariables = {
  filter?: ModelSubscriptionRoleFilterInput | null,
};

export type OnDeleteRoleSubscription = {
  onDeleteRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteRoleStaffSubscriptionVariables = {
  filter?: ModelSubscriptionRoleStaffFilterInput | null,
};

export type OnDeleteRoleStaffSubscription = {
  onDeleteRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteStaffSubscriptionVariables = {
  filter?: ModelSubscriptionStaffFilterInput | null,
};

export type OnDeleteStaffSubscription = {
  onDeleteStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnDeleteStaffSubcategorySubscriptionVariables = {
  filter?: ModelSubscriptionStaffSubcategoryFilterInput | null,
};

export type OnDeleteStaffSubcategorySubscription = {
  onDeleteStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteSubcategorySubscriptionVariables = {
  filter?: ModelSubscriptionSubcategoryFilterInput | null,
};

export type OnDeleteSubcategorySubscription = {
  onDeleteSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateAircraftSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftFilterInput | null,
};

export type OnUpdateAircraftSubscription = {
  onUpdateAircraft?:  {
    __typename: "Aircraft",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    document?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    staff?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateAircraftDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftDocumentFilterInput | null,
};

export type OnUpdateAircraftDocumentSubscription = {
  onUpdateAircraftDocument?:  {
    __typename: "AircraftDocument",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    document?:  {
      __typename: "Document",
      archived: boolean,
      createdAt: string,
      id: string,
      name: string,
      staffId?: string | null,
      subcategoryId?: string | null,
      updatedAt: string,
    } | null,
    documentId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateAircraftNoticeSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftNoticeFilterInput | null,
};

export type OnUpdateAircraftNoticeSubscription = {
  onUpdateAircraftNotice?:  {
    __typename: "AircraftNotice",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateAircraftStaffSubscriptionVariables = {
  filter?: ModelSubscriptionAircraftStaffFilterInput | null,
};

export type OnUpdateAircraftStaffSubscription = {
  onUpdateAircraftStaff?:  {
    __typename: "AircraftStaff",
    aircraft?:  {
      __typename: "Aircraft",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    aircraftId: string,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateCategorySubscriptionVariables = {
  filter?: ModelSubscriptionCategoryFilterInput | null,
};

export type OnUpdateCategorySubscription = {
  onUpdateCategory?:  {
    __typename: "Category",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    subcategories?:  {
      __typename: "ModelSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionDocumentFilterInput | null,
};

export type OnUpdateDocumentSubscription = {
  onUpdateDocument?:  {
    __typename: "Document",
    aircraft?:  {
      __typename: "ModelAircraftDocumentConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    id: string,
    name: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId?: string | null,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId?: string | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateNoticeSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeFilterInput | null,
};

export type OnUpdateNoticeSubscription = {
  onUpdateNotice?:  {
    __typename: "Notice",
    aircraft?:  {
      __typename: "ModelAircraftNoticeConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    author?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    deadline_at?: string | null,
    details: string,
    documents?:  {
      __typename: "ModelNoticeDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    noticed_at?: string | null,
    recipients?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    staffId?: string | null,
    status?: NoticeStatus | null,
    subject: string,
    type?: NoticeType | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateNoticeDocumentSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeDocumentFilterInput | null,
};

export type OnUpdateNoticeDocumentSubscription = {
  onUpdateNoticeDocument?:  {
    __typename: "NoticeDocument",
    createdAt: string,
    id: string,
    name: string,
    noticeId: string,
    notices?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateNoticeStaffSubscriptionVariables = {
  filter?: ModelSubscriptionNoticeStaffFilterInput | null,
};

export type OnUpdateNoticeStaffSubscription = {
  onUpdateNoticeStaff?:  {
    __typename: "NoticeStaff",
    createdAt: string,
    id: string,
    notice?:  {
      __typename: "Notice",
      archived: boolean,
      createdAt: string,
      deadline_at?: string | null,
      details: string,
      id: string,
      noticed_at?: string | null,
      staffId?: string | null,
      status?: NoticeStatus | null,
      subject: string,
      type?: NoticeType | null,
      updatedAt: string,
    } | null,
    noticeId: string,
    read_at?: string | null,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateRoleSubscriptionVariables = {
  filter?: ModelSubscriptionRoleFilterInput | null,
};

export type OnUpdateRoleSubscription = {
  onUpdateRole?:  {
    __typename: "Role",
    archived: boolean,
    createdAt: string,
    description?: string | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateRoleStaffSubscriptionVariables = {
  filter?: ModelSubscriptionRoleStaffFilterInput | null,
};

export type OnUpdateRoleStaffSubscription = {
  onUpdateRoleStaff?:  {
    __typename: "RoleStaff",
    createdAt: string,
    id: string,
    role?:  {
      __typename: "Role",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    roleId: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateStaffSubscriptionVariables = {
  filter?: ModelSubscriptionStaffFilterInput | null,
};

export type OnUpdateStaffSubscription = {
  onUpdateStaff?:  {
    __typename: "Staff",
    aircraft?:  {
      __typename: "ModelAircraftStaffConnection",
      nextToken?: string | null,
    } | null,
    archived: boolean,
    createdAt: string,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    email: string,
    id: string,
    name: string,
    notices?:  {
      __typename: "ModelNoticeConnection",
      nextToken?: string | null,
    } | null,
    notifications?:  {
      __typename: "ModelNoticeStaffConnection",
      nextToken?: string | null,
    } | null,
    roles?:  {
      __typename: "ModelRoleStaffConnection",
      nextToken?: string | null,
    } | null,
    subcategories?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};

export type OnUpdateStaffSubcategorySubscriptionVariables = {
  filter?: ModelSubscriptionStaffSubcategoryFilterInput | null,
};

export type OnUpdateStaffSubcategorySubscription = {
  onUpdateStaffSubcategory?:  {
    __typename: "StaffSubcategory",
    accessLevel: number,
    createdAt: string,
    id: string,
    staff?:  {
      __typename: "Staff",
      archived: boolean,
      createdAt: string,
      email: string,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    staffId: string,
    subcategory?:  {
      __typename: "Subcategory",
      archived: boolean,
      categoryId: string,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    subcategoryId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateSubcategorySubscriptionVariables = {
  filter?: ModelSubscriptionSubcategoryFilterInput | null,
};

export type OnUpdateSubcategorySubscription = {
  onUpdateSubcategory?:  {
    __typename: "Subcategory",
    archived: boolean,
    category?:  {
      __typename: "Category",
      archived: boolean,
      createdAt: string,
      description?: string | null,
      id: string,
      name: string,
      updatedAt: string,
    } | null,
    categoryId: string,
    createdAt: string,
    description?: string | null,
    documents?:  {
      __typename: "ModelDocumentConnection",
      nextToken?: string | null,
    } | null,
    id: string,
    name: string,
    staff?:  {
      __typename: "ModelStaffSubcategoryConnection",
      nextToken?: string | null,
    } | null,
    updatedAt: string,
  } | null,
};
