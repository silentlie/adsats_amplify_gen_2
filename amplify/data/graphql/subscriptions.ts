/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

import * as APITypes from "./API";
type GeneratedSubscription<InputType, OutputType> = string & {
  __generatedSubscriptionInput: InputType;
  __generatedSubscriptionOutput: OutputType;
};

export const onCreateAircraft = /* GraphQL */ `subscription OnCreateAircraft($filter: ModelSubscriptionAircraftFilterInput) {
  onCreateAircraft(filter: $filter) {
    archived
    createdAt
    description
    document {
      nextToken
      __typename
    }
    id
    name
    notices {
      nextToken
      __typename
    }
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateAircraftSubscriptionVariables,
  APITypes.OnCreateAircraftSubscription
>;
export const onCreateAircraftDocument = /* GraphQL */ `subscription OnCreateAircraftDocument(
  $filter: ModelSubscriptionAircraftDocumentFilterInput
) {
  onCreateAircraftDocument(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    document {
      archived
      createdAt
      id
      name
      staffId
      subcategoryId
      updatedAt
      __typename
    }
    documentId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateAircraftDocumentSubscriptionVariables,
  APITypes.OnCreateAircraftDocumentSubscription
>;
export const onCreateAircraftNotice = /* GraphQL */ `subscription OnCreateAircraftNotice(
  $filter: ModelSubscriptionAircraftNoticeFilterInput
) {
  onCreateAircraftNotice(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    notice {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    noticeId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateAircraftNoticeSubscriptionVariables,
  APITypes.OnCreateAircraftNoticeSubscription
>;
export const onCreateAircraftStaff = /* GraphQL */ `subscription OnCreateAircraftStaff(
  $filter: ModelSubscriptionAircraftStaffFilterInput
) {
  onCreateAircraftStaff(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateAircraftStaffSubscriptionVariables,
  APITypes.OnCreateAircraftStaffSubscription
>;
export const onCreateCategory = /* GraphQL */ `subscription OnCreateCategory($filter: ModelSubscriptionCategoryFilterInput) {
  onCreateCategory(filter: $filter) {
    archived
    createdAt
    description
    id
    name
    subcategories {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateCategorySubscriptionVariables,
  APITypes.OnCreateCategorySubscription
>;
export const onCreateDocument = /* GraphQL */ `subscription OnCreateDocument($filter: ModelSubscriptionDocumentFilterInput) {
  onCreateDocument(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    createdAt
    id
    name
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    subcategory {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    subcategoryId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateDocumentSubscriptionVariables,
  APITypes.OnCreateDocumentSubscription
>;
export const onCreateNotice = /* GraphQL */ `subscription OnCreateNotice($filter: ModelSubscriptionNoticeFilterInput) {
  onCreateNotice(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    author {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    createdAt
    deadline_at
    details
    documents {
      nextToken
      __typename
    }
    id
    noticed_at
    recipients {
      nextToken
      __typename
    }
    staffId
    status
    subject
    type
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateNoticeSubscriptionVariables,
  APITypes.OnCreateNoticeSubscription
>;
export const onCreateNoticeDocument = /* GraphQL */ `subscription OnCreateNoticeDocument(
  $filter: ModelSubscriptionNoticeDocumentFilterInput
) {
  onCreateNoticeDocument(filter: $filter) {
    createdAt
    id
    name
    noticeId
    notices {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateNoticeDocumentSubscriptionVariables,
  APITypes.OnCreateNoticeDocumentSubscription
>;
export const onCreateNoticeStaff = /* GraphQL */ `subscription OnCreateNoticeStaff(
  $filter: ModelSubscriptionNoticeStaffFilterInput
) {
  onCreateNoticeStaff(filter: $filter) {
    createdAt
    notice {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    noticeId
    read_at
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateNoticeStaffSubscriptionVariables,
  APITypes.OnCreateNoticeStaffSubscription
>;
export const onCreateRole = /* GraphQL */ `subscription OnCreateRole($filter: ModelSubscriptionRoleFilterInput) {
  onCreateRole(filter: $filter) {
    archived
    createdAt
    description
    id
    name
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateRoleSubscriptionVariables,
  APITypes.OnCreateRoleSubscription
>;
export const onCreateRoleStaff = /* GraphQL */ `subscription OnCreateRoleStaff($filter: ModelSubscriptionRoleStaffFilterInput) {
  onCreateRoleStaff(filter: $filter) {
    createdAt
    role {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    roleId
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateRoleStaffSubscriptionVariables,
  APITypes.OnCreateRoleStaffSubscription
>;
export const onCreateStaff = /* GraphQL */ `subscription OnCreateStaff($filter: ModelSubscriptionStaffFilterInput) {
  onCreateStaff(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    createdAt
    documents {
      nextToken
      __typename
    }
    email
    id
    name
    notices {
      nextToken
      __typename
    }
    notifications {
      nextToken
      __typename
    }
    roles {
      nextToken
      __typename
    }
    subcategories {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateStaffSubscriptionVariables,
  APITypes.OnCreateStaffSubscription
>;
export const onCreateStaffSubcategory = /* GraphQL */ `subscription OnCreateStaffSubcategory(
  $filter: ModelSubscriptionStaffSubcategoryFilterInput
) {
  onCreateStaffSubcategory(filter: $filter) {
    accessLevel
    createdAt
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    subcategory {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    subcategoryId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateStaffSubcategorySubscriptionVariables,
  APITypes.OnCreateStaffSubcategorySubscription
>;
export const onCreateSubcategory = /* GraphQL */ `subscription OnCreateSubcategory(
  $filter: ModelSubscriptionSubcategoryFilterInput
) {
  onCreateSubcategory(filter: $filter) {
    archived
    category {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    categoryId
    createdAt
    description
    documents {
      nextToken
      __typename
    }
    id
    name
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnCreateSubcategorySubscriptionVariables,
  APITypes.OnCreateSubcategorySubscription
>;
export const onDeleteAircraft = /* GraphQL */ `subscription OnDeleteAircraft($filter: ModelSubscriptionAircraftFilterInput) {
  onDeleteAircraft(filter: $filter) {
    archived
    createdAt
    description
    document {
      nextToken
      __typename
    }
    id
    name
    notices {
      nextToken
      __typename
    }
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteAircraftSubscriptionVariables,
  APITypes.OnDeleteAircraftSubscription
>;
export const onDeleteAircraftDocument = /* GraphQL */ `subscription OnDeleteAircraftDocument(
  $filter: ModelSubscriptionAircraftDocumentFilterInput
) {
  onDeleteAircraftDocument(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    document {
      archived
      createdAt
      id
      name
      staffId
      subcategoryId
      updatedAt
      __typename
    }
    documentId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteAircraftDocumentSubscriptionVariables,
  APITypes.OnDeleteAircraftDocumentSubscription
>;
export const onDeleteAircraftNotice = /* GraphQL */ `subscription OnDeleteAircraftNotice(
  $filter: ModelSubscriptionAircraftNoticeFilterInput
) {
  onDeleteAircraftNotice(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    notice {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    noticeId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteAircraftNoticeSubscriptionVariables,
  APITypes.OnDeleteAircraftNoticeSubscription
>;
export const onDeleteAircraftStaff = /* GraphQL */ `subscription OnDeleteAircraftStaff(
  $filter: ModelSubscriptionAircraftStaffFilterInput
) {
  onDeleteAircraftStaff(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteAircraftStaffSubscriptionVariables,
  APITypes.OnDeleteAircraftStaffSubscription
>;
export const onDeleteCategory = /* GraphQL */ `subscription OnDeleteCategory($filter: ModelSubscriptionCategoryFilterInput) {
  onDeleteCategory(filter: $filter) {
    archived
    createdAt
    description
    id
    name
    subcategories {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteCategorySubscriptionVariables,
  APITypes.OnDeleteCategorySubscription
>;
export const onDeleteDocument = /* GraphQL */ `subscription OnDeleteDocument($filter: ModelSubscriptionDocumentFilterInput) {
  onDeleteDocument(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    createdAt
    id
    name
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    subcategory {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    subcategoryId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteDocumentSubscriptionVariables,
  APITypes.OnDeleteDocumentSubscription
>;
export const onDeleteNotice = /* GraphQL */ `subscription OnDeleteNotice($filter: ModelSubscriptionNoticeFilterInput) {
  onDeleteNotice(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    author {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    createdAt
    deadline_at
    details
    documents {
      nextToken
      __typename
    }
    id
    noticed_at
    recipients {
      nextToken
      __typename
    }
    staffId
    status
    subject
    type
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteNoticeSubscriptionVariables,
  APITypes.OnDeleteNoticeSubscription
>;
export const onDeleteNoticeDocument = /* GraphQL */ `subscription OnDeleteNoticeDocument(
  $filter: ModelSubscriptionNoticeDocumentFilterInput
) {
  onDeleteNoticeDocument(filter: $filter) {
    createdAt
    id
    name
    noticeId
    notices {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteNoticeDocumentSubscriptionVariables,
  APITypes.OnDeleteNoticeDocumentSubscription
>;
export const onDeleteNoticeStaff = /* GraphQL */ `subscription OnDeleteNoticeStaff(
  $filter: ModelSubscriptionNoticeStaffFilterInput
) {
  onDeleteNoticeStaff(filter: $filter) {
    createdAt
    notice {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    noticeId
    read_at
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteNoticeStaffSubscriptionVariables,
  APITypes.OnDeleteNoticeStaffSubscription
>;
export const onDeleteRole = /* GraphQL */ `subscription OnDeleteRole($filter: ModelSubscriptionRoleFilterInput) {
  onDeleteRole(filter: $filter) {
    archived
    createdAt
    description
    id
    name
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteRoleSubscriptionVariables,
  APITypes.OnDeleteRoleSubscription
>;
export const onDeleteRoleStaff = /* GraphQL */ `subscription OnDeleteRoleStaff($filter: ModelSubscriptionRoleStaffFilterInput) {
  onDeleteRoleStaff(filter: $filter) {
    createdAt
    role {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    roleId
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteRoleStaffSubscriptionVariables,
  APITypes.OnDeleteRoleStaffSubscription
>;
export const onDeleteStaff = /* GraphQL */ `subscription OnDeleteStaff($filter: ModelSubscriptionStaffFilterInput) {
  onDeleteStaff(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    createdAt
    documents {
      nextToken
      __typename
    }
    email
    id
    name
    notices {
      nextToken
      __typename
    }
    notifications {
      nextToken
      __typename
    }
    roles {
      nextToken
      __typename
    }
    subcategories {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteStaffSubscriptionVariables,
  APITypes.OnDeleteStaffSubscription
>;
export const onDeleteStaffSubcategory = /* GraphQL */ `subscription OnDeleteStaffSubcategory(
  $filter: ModelSubscriptionStaffSubcategoryFilterInput
) {
  onDeleteStaffSubcategory(filter: $filter) {
    accessLevel
    createdAt
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    subcategory {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    subcategoryId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteStaffSubcategorySubscriptionVariables,
  APITypes.OnDeleteStaffSubcategorySubscription
>;
export const onDeleteSubcategory = /* GraphQL */ `subscription OnDeleteSubcategory(
  $filter: ModelSubscriptionSubcategoryFilterInput
) {
  onDeleteSubcategory(filter: $filter) {
    archived
    category {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    categoryId
    createdAt
    description
    documents {
      nextToken
      __typename
    }
    id
    name
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnDeleteSubcategorySubscriptionVariables,
  APITypes.OnDeleteSubcategorySubscription
>;
export const onUpdateAircraft = /* GraphQL */ `subscription OnUpdateAircraft($filter: ModelSubscriptionAircraftFilterInput) {
  onUpdateAircraft(filter: $filter) {
    archived
    createdAt
    description
    document {
      nextToken
      __typename
    }
    id
    name
    notices {
      nextToken
      __typename
    }
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateAircraftSubscriptionVariables,
  APITypes.OnUpdateAircraftSubscription
>;
export const onUpdateAircraftDocument = /* GraphQL */ `subscription OnUpdateAircraftDocument(
  $filter: ModelSubscriptionAircraftDocumentFilterInput
) {
  onUpdateAircraftDocument(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    document {
      archived
      createdAt
      id
      name
      staffId
      subcategoryId
      updatedAt
      __typename
    }
    documentId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateAircraftDocumentSubscriptionVariables,
  APITypes.OnUpdateAircraftDocumentSubscription
>;
export const onUpdateAircraftNotice = /* GraphQL */ `subscription OnUpdateAircraftNotice(
  $filter: ModelSubscriptionAircraftNoticeFilterInput
) {
  onUpdateAircraftNotice(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    notice {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    noticeId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateAircraftNoticeSubscriptionVariables,
  APITypes.OnUpdateAircraftNoticeSubscription
>;
export const onUpdateAircraftStaff = /* GraphQL */ `subscription OnUpdateAircraftStaff(
  $filter: ModelSubscriptionAircraftStaffFilterInput
) {
  onUpdateAircraftStaff(filter: $filter) {
    aircraft {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    aircraftId
    createdAt
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateAircraftStaffSubscriptionVariables,
  APITypes.OnUpdateAircraftStaffSubscription
>;
export const onUpdateCategory = /* GraphQL */ `subscription OnUpdateCategory($filter: ModelSubscriptionCategoryFilterInput) {
  onUpdateCategory(filter: $filter) {
    archived
    createdAt
    description
    id
    name
    subcategories {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateCategorySubscriptionVariables,
  APITypes.OnUpdateCategorySubscription
>;
export const onUpdateDocument = /* GraphQL */ `subscription OnUpdateDocument($filter: ModelSubscriptionDocumentFilterInput) {
  onUpdateDocument(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    createdAt
    id
    name
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    subcategory {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    subcategoryId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateDocumentSubscriptionVariables,
  APITypes.OnUpdateDocumentSubscription
>;
export const onUpdateNotice = /* GraphQL */ `subscription OnUpdateNotice($filter: ModelSubscriptionNoticeFilterInput) {
  onUpdateNotice(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    author {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    createdAt
    deadline_at
    details
    documents {
      nextToken
      __typename
    }
    id
    noticed_at
    recipients {
      nextToken
      __typename
    }
    staffId
    status
    subject
    type
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateNoticeSubscriptionVariables,
  APITypes.OnUpdateNoticeSubscription
>;
export const onUpdateNoticeDocument = /* GraphQL */ `subscription OnUpdateNoticeDocument(
  $filter: ModelSubscriptionNoticeDocumentFilterInput
) {
  onUpdateNoticeDocument(filter: $filter) {
    createdAt
    id
    name
    noticeId
    notices {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateNoticeDocumentSubscriptionVariables,
  APITypes.OnUpdateNoticeDocumentSubscription
>;
export const onUpdateNoticeStaff = /* GraphQL */ `subscription OnUpdateNoticeStaff(
  $filter: ModelSubscriptionNoticeStaffFilterInput
) {
  onUpdateNoticeStaff(filter: $filter) {
    createdAt
    notice {
      archived
      createdAt
      deadline_at
      details
      id
      noticed_at
      staffId
      status
      subject
      type
      updatedAt
      __typename
    }
    noticeId
    read_at
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateNoticeStaffSubscriptionVariables,
  APITypes.OnUpdateNoticeStaffSubscription
>;
export const onUpdateRole = /* GraphQL */ `subscription OnUpdateRole($filter: ModelSubscriptionRoleFilterInput) {
  onUpdateRole(filter: $filter) {
    archived
    createdAt
    description
    id
    name
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateRoleSubscriptionVariables,
  APITypes.OnUpdateRoleSubscription
>;
export const onUpdateRoleStaff = /* GraphQL */ `subscription OnUpdateRoleStaff($filter: ModelSubscriptionRoleStaffFilterInput) {
  onUpdateRoleStaff(filter: $filter) {
    createdAt
    role {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    roleId
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateRoleStaffSubscriptionVariables,
  APITypes.OnUpdateRoleStaffSubscription
>;
export const onUpdateStaff = /* GraphQL */ `subscription OnUpdateStaff($filter: ModelSubscriptionStaffFilterInput) {
  onUpdateStaff(filter: $filter) {
    aircraft {
      nextToken
      __typename
    }
    archived
    createdAt
    documents {
      nextToken
      __typename
    }
    email
    id
    name
    notices {
      nextToken
      __typename
    }
    notifications {
      nextToken
      __typename
    }
    roles {
      nextToken
      __typename
    }
    subcategories {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateStaffSubscriptionVariables,
  APITypes.OnUpdateStaffSubscription
>;
export const onUpdateStaffSubcategory = /* GraphQL */ `subscription OnUpdateStaffSubcategory(
  $filter: ModelSubscriptionStaffSubcategoryFilterInput
) {
  onUpdateStaffSubcategory(filter: $filter) {
    accessLevel
    createdAt
    staff {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    staffId
    subcategory {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    subcategoryId
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateStaffSubcategorySubscriptionVariables,
  APITypes.OnUpdateStaffSubcategorySubscription
>;
export const onUpdateSubcategory = /* GraphQL */ `subscription OnUpdateSubcategory(
  $filter: ModelSubscriptionSubcategoryFilterInput
) {
  onUpdateSubcategory(filter: $filter) {
    archived
    category {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    categoryId
    createdAt
    description
    documents {
      nextToken
      __typename
    }
    id
    name
    staff {
      nextToken
      __typename
    }
    updatedAt
    __typename
  }
}
` as GeneratedSubscription<
  APITypes.OnUpdateSubcategorySubscriptionVariables,
  APITypes.OnUpdateSubcategorySubscription
>;
