/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

import * as APITypes from "./API";
type GeneratedMutation<InputType, OutputType> = string & {
  __generatedMutationInput: InputType;
  __generatedMutationOutput: OutputType;
};

export const createAircraft = /* GraphQL */ `mutation CreateAircraft(
  $condition: ModelAircraftConditionInput
  $input: CreateAircraftInput!
) {
  createAircraft(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateAircraftMutationVariables,
  APITypes.CreateAircraftMutation
>;
export const createAircraftDocument = /* GraphQL */ `mutation CreateAircraftDocument(
  $condition: ModelAircraftDocumentConditionInput
  $input: CreateAircraftDocumentInput!
) {
  createAircraftDocument(condition: $condition, input: $input) {
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
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.CreateAircraftDocumentMutationVariables,
  APITypes.CreateAircraftDocumentMutation
>;
export const createAircraftNotice = /* GraphQL */ `mutation CreateAircraftNotice(
  $condition: ModelAircraftNoticeConditionInput
  $input: CreateAircraftNoticeInput!
) {
  createAircraftNotice(condition: $condition, input: $input) {
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
    id
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
` as GeneratedMutation<
  APITypes.CreateAircraftNoticeMutationVariables,
  APITypes.CreateAircraftNoticeMutation
>;
export const createAircraftStaff = /* GraphQL */ `mutation CreateAircraftStaff(
  $condition: ModelAircraftStaffConditionInput
  $input: CreateAircraftStaffInput!
) {
  createAircraftStaff(condition: $condition, input: $input) {
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
    id
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
` as GeneratedMutation<
  APITypes.CreateAircraftStaffMutationVariables,
  APITypes.CreateAircraftStaffMutation
>;
export const createCategory = /* GraphQL */ `mutation CreateCategory(
  $condition: ModelCategoryConditionInput
  $input: CreateCategoryInput!
) {
  createCategory(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateCategoryMutationVariables,
  APITypes.CreateCategoryMutation
>;
export const createDocument = /* GraphQL */ `mutation CreateDocument(
  $condition: ModelDocumentConditionInput
  $input: CreateDocumentInput!
) {
  createDocument(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateDocumentMutationVariables,
  APITypes.CreateDocumentMutation
>;
export const createNotice = /* GraphQL */ `mutation CreateNotice(
  $condition: ModelNoticeConditionInput
  $input: CreateNoticeInput!
) {
  createNotice(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateNoticeMutationVariables,
  APITypes.CreateNoticeMutation
>;
export const createNoticeDocument = /* GraphQL */ `mutation CreateNoticeDocument(
  $condition: ModelNoticeDocumentConditionInput
  $input: CreateNoticeDocumentInput!
) {
  createNoticeDocument(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateNoticeDocumentMutationVariables,
  APITypes.CreateNoticeDocumentMutation
>;
export const createNotification = /* GraphQL */ `mutation CreateNotification(
  $condition: ModelNotificationConditionInput
  $input: CreateNotificationInput!
) {
  createNotification(condition: $condition, input: $input) {
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.CreateNotificationMutationVariables,
  APITypes.CreateNotificationMutation
>;
export const createRole = /* GraphQL */ `mutation CreateRole(
  $condition: ModelRoleConditionInput
  $input: CreateRoleInput!
) {
  createRole(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateRoleMutationVariables,
  APITypes.CreateRoleMutation
>;
export const createRoleStaff = /* GraphQL */ `mutation CreateRoleStaff(
  $condition: ModelRoleStaffConditionInput
  $input: CreateRoleStaffInput!
) {
  createRoleStaff(condition: $condition, input: $input) {
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.CreateRoleStaffMutationVariables,
  APITypes.CreateRoleStaffMutation
>;
export const createStaff = /* GraphQL */ `mutation CreateStaff(
  $condition: ModelStaffConditionInput
  $input: CreateStaffInput!
) {
  createStaff(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateStaffMutationVariables,
  APITypes.CreateStaffMutation
>;
export const createStaffSubcategory = /* GraphQL */ `mutation CreateStaffSubcategory(
  $condition: ModelStaffSubcategoryConditionInput
  $input: CreateStaffSubcategoryInput!
) {
  createStaffSubcategory(condition: $condition, input: $input) {
    accessLevel
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.CreateStaffSubcategoryMutationVariables,
  APITypes.CreateStaffSubcategoryMutation
>;
export const createSubcategory = /* GraphQL */ `mutation CreateSubcategory(
  $condition: ModelSubcategoryConditionInput
  $input: CreateSubcategoryInput!
) {
  createSubcategory(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateSubcategoryMutationVariables,
  APITypes.CreateSubcategoryMutation
>;
export const deleteAircraft = /* GraphQL */ `mutation DeleteAircraft(
  $condition: ModelAircraftConditionInput
  $input: DeleteAircraftInput!
) {
  deleteAircraft(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteAircraftMutationVariables,
  APITypes.DeleteAircraftMutation
>;
export const deleteAircraftDocument = /* GraphQL */ `mutation DeleteAircraftDocument(
  $condition: ModelAircraftDocumentConditionInput
  $input: DeleteAircraftDocumentInput!
) {
  deleteAircraftDocument(condition: $condition, input: $input) {
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
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.DeleteAircraftDocumentMutationVariables,
  APITypes.DeleteAircraftDocumentMutation
>;
export const deleteAircraftNotice = /* GraphQL */ `mutation DeleteAircraftNotice(
  $condition: ModelAircraftNoticeConditionInput
  $input: DeleteAircraftNoticeInput!
) {
  deleteAircraftNotice(condition: $condition, input: $input) {
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
    id
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
` as GeneratedMutation<
  APITypes.DeleteAircraftNoticeMutationVariables,
  APITypes.DeleteAircraftNoticeMutation
>;
export const deleteAircraftStaff = /* GraphQL */ `mutation DeleteAircraftStaff(
  $condition: ModelAircraftStaffConditionInput
  $input: DeleteAircraftStaffInput!
) {
  deleteAircraftStaff(condition: $condition, input: $input) {
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
    id
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
` as GeneratedMutation<
  APITypes.DeleteAircraftStaffMutationVariables,
  APITypes.DeleteAircraftStaffMutation
>;
export const deleteCategory = /* GraphQL */ `mutation DeleteCategory(
  $condition: ModelCategoryConditionInput
  $input: DeleteCategoryInput!
) {
  deleteCategory(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteCategoryMutationVariables,
  APITypes.DeleteCategoryMutation
>;
export const deleteDocument = /* GraphQL */ `mutation DeleteDocument(
  $condition: ModelDocumentConditionInput
  $input: DeleteDocumentInput!
) {
  deleteDocument(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteDocumentMutationVariables,
  APITypes.DeleteDocumentMutation
>;
export const deleteNotice = /* GraphQL */ `mutation DeleteNotice(
  $condition: ModelNoticeConditionInput
  $input: DeleteNoticeInput!
) {
  deleteNotice(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteNoticeMutationVariables,
  APITypes.DeleteNoticeMutation
>;
export const deleteNoticeDocument = /* GraphQL */ `mutation DeleteNoticeDocument(
  $condition: ModelNoticeDocumentConditionInput
  $input: DeleteNoticeDocumentInput!
) {
  deleteNoticeDocument(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteNoticeDocumentMutationVariables,
  APITypes.DeleteNoticeDocumentMutation
>;
export const deleteNotification = /* GraphQL */ `mutation DeleteNotification(
  $condition: ModelNotificationConditionInput
  $input: DeleteNotificationInput!
) {
  deleteNotification(condition: $condition, input: $input) {
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.DeleteNotificationMutationVariables,
  APITypes.DeleteNotificationMutation
>;
export const deleteRole = /* GraphQL */ `mutation DeleteRole(
  $condition: ModelRoleConditionInput
  $input: DeleteRoleInput!
) {
  deleteRole(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteRoleMutationVariables,
  APITypes.DeleteRoleMutation
>;
export const deleteRoleStaff = /* GraphQL */ `mutation DeleteRoleStaff(
  $condition: ModelRoleStaffConditionInput
  $input: DeleteRoleStaffInput!
) {
  deleteRoleStaff(condition: $condition, input: $input) {
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.DeleteRoleStaffMutationVariables,
  APITypes.DeleteRoleStaffMutation
>;
export const deleteStaff = /* GraphQL */ `mutation DeleteStaff(
  $condition: ModelStaffConditionInput
  $input: DeleteStaffInput!
) {
  deleteStaff(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteStaffMutationVariables,
  APITypes.DeleteStaffMutation
>;
export const deleteStaffSubcategory = /* GraphQL */ `mutation DeleteStaffSubcategory(
  $condition: ModelStaffSubcategoryConditionInput
  $input: DeleteStaffSubcategoryInput!
) {
  deleteStaffSubcategory(condition: $condition, input: $input) {
    accessLevel
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.DeleteStaffSubcategoryMutationVariables,
  APITypes.DeleteStaffSubcategoryMutation
>;
export const deleteSubcategory = /* GraphQL */ `mutation DeleteSubcategory(
  $condition: ModelSubcategoryConditionInput
  $input: DeleteSubcategoryInput!
) {
  deleteSubcategory(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteSubcategoryMutationVariables,
  APITypes.DeleteSubcategoryMutation
>;
export const postConfirmation = /* GraphQL */ `mutation PostConfirmation {
  postConfirmation
}
` as GeneratedMutation<
  APITypes.PostConfirmationMutationVariables,
  APITypes.PostConfirmationMutation
>;
export const updateAircraft = /* GraphQL */ `mutation UpdateAircraft(
  $condition: ModelAircraftConditionInput
  $input: UpdateAircraftInput!
) {
  updateAircraft(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateAircraftMutationVariables,
  APITypes.UpdateAircraftMutation
>;
export const updateAircraftDocument = /* GraphQL */ `mutation UpdateAircraftDocument(
  $condition: ModelAircraftDocumentConditionInput
  $input: UpdateAircraftDocumentInput!
) {
  updateAircraftDocument(condition: $condition, input: $input) {
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
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.UpdateAircraftDocumentMutationVariables,
  APITypes.UpdateAircraftDocumentMutation
>;
export const updateAircraftNotice = /* GraphQL */ `mutation UpdateAircraftNotice(
  $condition: ModelAircraftNoticeConditionInput
  $input: UpdateAircraftNoticeInput!
) {
  updateAircraftNotice(condition: $condition, input: $input) {
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
    id
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
` as GeneratedMutation<
  APITypes.UpdateAircraftNoticeMutationVariables,
  APITypes.UpdateAircraftNoticeMutation
>;
export const updateAircraftStaff = /* GraphQL */ `mutation UpdateAircraftStaff(
  $condition: ModelAircraftStaffConditionInput
  $input: UpdateAircraftStaffInput!
) {
  updateAircraftStaff(condition: $condition, input: $input) {
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
    id
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
` as GeneratedMutation<
  APITypes.UpdateAircraftStaffMutationVariables,
  APITypes.UpdateAircraftStaffMutation
>;
export const updateCategory = /* GraphQL */ `mutation UpdateCategory(
  $condition: ModelCategoryConditionInput
  $input: UpdateCategoryInput!
) {
  updateCategory(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateCategoryMutationVariables,
  APITypes.UpdateCategoryMutation
>;
export const updateDocument = /* GraphQL */ `mutation UpdateDocument(
  $condition: ModelDocumentConditionInput
  $input: UpdateDocumentInput!
) {
  updateDocument(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateDocumentMutationVariables,
  APITypes.UpdateDocumentMutation
>;
export const updateNotice = /* GraphQL */ `mutation UpdateNotice(
  $condition: ModelNoticeConditionInput
  $input: UpdateNoticeInput!
) {
  updateNotice(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateNoticeMutationVariables,
  APITypes.UpdateNoticeMutation
>;
export const updateNoticeDocument = /* GraphQL */ `mutation UpdateNoticeDocument(
  $condition: ModelNoticeDocumentConditionInput
  $input: UpdateNoticeDocumentInput!
) {
  updateNoticeDocument(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateNoticeDocumentMutationVariables,
  APITypes.UpdateNoticeDocumentMutation
>;
export const updateNotification = /* GraphQL */ `mutation UpdateNotification(
  $condition: ModelNotificationConditionInput
  $input: UpdateNotificationInput!
) {
  updateNotification(condition: $condition, input: $input) {
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.UpdateNotificationMutationVariables,
  APITypes.UpdateNotificationMutation
>;
export const updateRole = /* GraphQL */ `mutation UpdateRole(
  $condition: ModelRoleConditionInput
  $input: UpdateRoleInput!
) {
  updateRole(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateRoleMutationVariables,
  APITypes.UpdateRoleMutation
>;
export const updateRoleStaff = /* GraphQL */ `mutation UpdateRoleStaff(
  $condition: ModelRoleStaffConditionInput
  $input: UpdateRoleStaffInput!
) {
  updateRoleStaff(condition: $condition, input: $input) {
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.UpdateRoleStaffMutationVariables,
  APITypes.UpdateRoleStaffMutation
>;
export const updateStaff = /* GraphQL */ `mutation UpdateStaff(
  $condition: ModelStaffConditionInput
  $input: UpdateStaffInput!
) {
  updateStaff(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateStaffMutationVariables,
  APITypes.UpdateStaffMutation
>;
export const updateStaffSubcategory = /* GraphQL */ `mutation UpdateStaffSubcategory(
  $condition: ModelStaffSubcategoryConditionInput
  $input: UpdateStaffSubcategoryInput!
) {
  updateStaffSubcategory(condition: $condition, input: $input) {
    accessLevel
    createdAt
    id
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
` as GeneratedMutation<
  APITypes.UpdateStaffSubcategoryMutationVariables,
  APITypes.UpdateStaffSubcategoryMutation
>;
export const updateSubcategory = /* GraphQL */ `mutation UpdateSubcategory(
  $condition: ModelSubcategoryConditionInput
  $input: UpdateSubcategoryInput!
) {
  updateSubcategory(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateSubcategoryMutationVariables,
  APITypes.UpdateSubcategoryMutation
>;
