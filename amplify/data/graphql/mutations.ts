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
export const createAircraftOverride = /* GraphQL */ `mutation CreateAircraftOverride(
  $archived: Boolean!
  $description: String!
  $name: String!
  $staff: [ID!]
) {
  createAircraftOverride(
    archived: $archived
    description: $description
    name: $name
    staff: $staff
  )
}
` as GeneratedMutation<
  APITypes.CreateAircraftOverrideMutationVariables,
  APITypes.CreateAircraftOverrideMutation
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
export const createDocumentOverride = /* GraphQL */ `mutation CreateDocumentOverride(
  $aircraft: [ID!]
  $archived: Boolean!
  $name: String!
  $staffId: ID!
  $subcategoryId: ID!
) {
  createDocumentOverride(
    aircraft: $aircraft
    archived: $archived
    name: $name
    staffId: $staffId
    subcategoryId: $subcategoryId
  )
}
` as GeneratedMutation<
  APITypes.CreateDocumentOverrideMutationVariables,
  APITypes.CreateDocumentOverrideMutation
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
export const createNoticeOverride = /* GraphQL */ `mutation CreateNoticeOverride(
  $aircraft: [ID!]
  $archived: Boolean!
  $deadline_at: AWSDateTime
  $details: AWSJSON!
  $documents: [String!]
  $noticed_at: AWSDateTime
  $recipients: [ID!]
  $staffId: ID!
  $status: CreateNoticeOverrideStatus
  $subject: String!
  $type: CreateNoticeOverrideType
) {
  createNoticeOverride(
    aircraft: $aircraft
    archived: $archived
    deadline_at: $deadline_at
    details: $details
    documents: $documents
    noticed_at: $noticed_at
    recipients: $recipients
    staffId: $staffId
    status: $status
    subject: $subject
    type: $type
  )
}
` as GeneratedMutation<
  APITypes.CreateNoticeOverrideMutationVariables,
  APITypes.CreateNoticeOverrideMutation
>;
export const createNoticeStaff = /* GraphQL */ `mutation CreateNoticeStaff(
  $condition: ModelNoticeStaffConditionInput
  $input: CreateNoticeStaffInput!
) {
  createNoticeStaff(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.CreateNoticeStaffMutationVariables,
  APITypes.CreateNoticeStaffMutation
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
export const createRoleOverride = /* GraphQL */ `mutation CreateRoleOverride(
  $archived: Boolean!
  $description: String!
  $name: String!
  $staff: [ID!]
) {
  createRoleOverride(
    archived: $archived
    description: $description
    name: $name
    staff: $staff
  )
}
` as GeneratedMutation<
  APITypes.CreateRoleOverrideMutationVariables,
  APITypes.CreateRoleOverrideMutation
>;
export const createRoleStaff = /* GraphQL */ `mutation CreateRoleStaff(
  $condition: ModelRoleStaffConditionInput
  $input: CreateRoleStaffInput!
) {
  createRoleStaff(condition: $condition, input: $input) {
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
export const createStaffOverride = /* GraphQL */ `mutation CreateStaffOverride(
  $accessLevels: [Int!]
  $aircraft: [ID!]
  $archived: Boolean!
  $email: AWSEmail!
  $name: String!
  $roles: [ID!]
  $subcategories: [ID!]
) {
  createStaffOverride(
    accessLevels: $accessLevels
    aircraft: $aircraft
    archived: $archived
    email: $email
    name: $name
    roles: $roles
    subcategories: $subcategories
  )
}
` as GeneratedMutation<
  APITypes.CreateStaffOverrideMutationVariables,
  APITypes.CreateStaffOverrideMutation
>;
export const createStaffSubcategory = /* GraphQL */ `mutation CreateStaffSubcategory(
  $condition: ModelStaffSubcategoryConditionInput
  $input: CreateStaffSubcategoryInput!
) {
  createStaffSubcategory(condition: $condition, input: $input) {
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
export const createSubcategoryOverride = /* GraphQL */ `mutation CreateSubcategoryOverride(
  $accessLevels: [Int!]
  $archived: Boolean!
  $categoryId: ID!
  $description: String!
  $name: String!
  $staff: [ID!]
) {
  createSubcategoryOverride(
    accessLevels: $accessLevels
    archived: $archived
    categoryId: $categoryId
    description: $description
    name: $name
    staff: $staff
  )
}
` as GeneratedMutation<
  APITypes.CreateSubcategoryOverrideMutationVariables,
  APITypes.CreateSubcategoryOverrideMutation
>;
export const createUser = /* GraphQL */ `mutation CreateUser(
  $email: AWSEmail!
  $name: String!
  $temporaryPassword: String!
) {
  createUser(email: $email, name: $name, temporaryPassword: $temporaryPassword)
}
` as GeneratedMutation<
  APITypes.CreateUserMutationVariables,
  APITypes.CreateUserMutation
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
export const deleteAircraftOverride = /* GraphQL */ `mutation DeleteAircraftOverride($aircraftId: ID!) {
  deleteAircraftOverride(aircraftId: $aircraftId)
}
` as GeneratedMutation<
  APITypes.DeleteAircraftOverrideMutationVariables,
  APITypes.DeleteAircraftOverrideMutation
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
export const deleteCategoryOverride = /* GraphQL */ `mutation DeleteCategoryOverride($categoryId: ID!) {
  deleteCategoryOverride(categoryId: $categoryId)
}
` as GeneratedMutation<
  APITypes.DeleteCategoryOverrideMutationVariables,
  APITypes.DeleteCategoryOverrideMutation
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
export const deleteDocumentOverride = /* GraphQL */ `mutation DeleteDocumentOverride($documentId: ID!, $documentName: String!) {
  deleteDocumentOverride(documentId: $documentId, documentName: $documentName)
}
` as GeneratedMutation<
  APITypes.DeleteDocumentOverrideMutationVariables,
  APITypes.DeleteDocumentOverrideMutation
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
export const deleteNoticeDocumentOverride = /* GraphQL */ `mutation DeleteNoticeDocumentOverride(
  $noticeDocumentId: ID!
  $noticeDocumentName: String!
) {
  deleteNoticeDocumentOverride(
    noticeDocumentId: $noticeDocumentId
    noticeDocumentName: $noticeDocumentName
  )
}
` as GeneratedMutation<
  APITypes.DeleteNoticeDocumentOverrideMutationVariables,
  APITypes.DeleteNoticeDocumentOverrideMutation
>;
export const deleteNoticeOverride = /* GraphQL */ `mutation DeleteNoticeOverride($noticeId: ID!) {
  deleteNoticeOverride(noticeId: $noticeId)
}
` as GeneratedMutation<
  APITypes.DeleteNoticeOverrideMutationVariables,
  APITypes.DeleteNoticeOverrideMutation
>;
export const deleteNoticeStaff = /* GraphQL */ `mutation DeleteNoticeStaff(
  $condition: ModelNoticeStaffConditionInput
  $input: DeleteNoticeStaffInput!
) {
  deleteNoticeStaff(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.DeleteNoticeStaffMutationVariables,
  APITypes.DeleteNoticeStaffMutation
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
export const deleteRoleOverride = /* GraphQL */ `mutation DeleteRoleOverride($roleId: ID!) {
  deleteRoleOverride(roleId: $roleId)
}
` as GeneratedMutation<
  APITypes.DeleteRoleOverrideMutationVariables,
  APITypes.DeleteRoleOverrideMutation
>;
export const deleteRoleStaff = /* GraphQL */ `mutation DeleteRoleStaff(
  $condition: ModelRoleStaffConditionInput
  $input: DeleteRoleStaffInput!
) {
  deleteRoleStaff(condition: $condition, input: $input) {
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
export const deleteStaffOverride = /* GraphQL */ `mutation DeleteStaffOverride($staffId: ID!) {
  deleteStaffOverride(staffId: $staffId)
}
` as GeneratedMutation<
  APITypes.DeleteStaffOverrideMutationVariables,
  APITypes.DeleteStaffOverrideMutation
>;
export const deleteStaffSubcategory = /* GraphQL */ `mutation DeleteStaffSubcategory(
  $condition: ModelStaffSubcategoryConditionInput
  $input: DeleteStaffSubcategoryInput!
) {
  deleteStaffSubcategory(condition: $condition, input: $input) {
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
export const deleteSubcategoryOverride = /* GraphQL */ `mutation DeleteSubcategoryOverride($subcategoryId: ID!) {
  deleteSubcategoryOverride(subcategoryId: $subcategoryId)
}
` as GeneratedMutation<
  APITypes.DeleteSubcategoryOverrideMutationVariables,
  APITypes.DeleteSubcategoryOverrideMutation
>;
export const deleteUser = /* GraphQL */ `mutation DeleteUser($id: ID!) {
  deleteUser(id: $id)
}
` as GeneratedMutation<
  APITypes.DeleteUserMutationVariables,
  APITypes.DeleteUserMutation
>;
export const disableUser = /* GraphQL */ `mutation DisableUser($id: ID!) {
  disableUser(id: $id)
}
` as GeneratedMutation<
  APITypes.DisableUserMutationVariables,
  APITypes.DisableUserMutation
>;
export const enableUser = /* GraphQL */ `mutation EnableUser($id: ID!) {
  enableUser(id: $id)
}
` as GeneratedMutation<
  APITypes.EnableUserMutationVariables,
  APITypes.EnableUserMutation
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
export const updateAircraftNoticeOverride = /* GraphQL */ `mutation UpdateAircraftNoticeOverride(
  $compareKey: UpdateAircraftNoticeOverrideCompareKey
  $id: ID!
  $ids: [ID!]!
) {
  updateAircraftNoticeOverride(compareKey: $compareKey, id: $id, ids: $ids)
}
` as GeneratedMutation<
  APITypes.UpdateAircraftNoticeOverrideMutationVariables,
  APITypes.UpdateAircraftNoticeOverrideMutation
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
export const updateAircraftStaffOverride = /* GraphQL */ `mutation UpdateAircraftStaffOverride(
  $compareKey: UpdateAircraftStaffOverrideCompareKey
  $id: ID!
  $ids: [ID!]!
) {
  updateAircraftStaffOverride(compareKey: $compareKey, id: $id, ids: $ids)
}
` as GeneratedMutation<
  APITypes.UpdateAircraftStaffOverrideMutationVariables,
  APITypes.UpdateAircraftStaffOverrideMutation
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
export const updateNoticeStaff = /* GraphQL */ `mutation UpdateNoticeStaff(
  $condition: ModelNoticeStaffConditionInput
  $input: UpdateNoticeStaffInput!
) {
  updateNoticeStaff(condition: $condition, input: $input) {
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
` as GeneratedMutation<
  APITypes.UpdateNoticeStaffMutationVariables,
  APITypes.UpdateNoticeStaffMutation
>;
export const updateNoticeStaffOverride = /* GraphQL */ `mutation UpdateNoticeStaffOverride(
  $aircraftIds: [ID!]
  $noticeId: ID!
  $roleIds: [ID!]
  $staffIds: [ID!]
) {
  updateNoticeStaffOverride(
    aircraftIds: $aircraftIds
    noticeId: $noticeId
    roleIds: $roleIds
    staffIds: $staffIds
  )
}
` as GeneratedMutation<
  APITypes.UpdateNoticeStaffOverrideMutationVariables,
  APITypes.UpdateNoticeStaffOverrideMutation
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
export const updateRoleStaffOverride = /* GraphQL */ `mutation UpdateRoleStaffOverride(
  $compareKey: UpdateRoleStaffOverrideCompareKey
  $id: ID!
  $ids: [ID!]!
) {
  updateRoleStaffOverride(compareKey: $compareKey, id: $id, ids: $ids)
}
` as GeneratedMutation<
  APITypes.UpdateRoleStaffOverrideMutationVariables,
  APITypes.UpdateRoleStaffOverrideMutation
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
export const updateStaffSubcategoryOverride = /* GraphQL */ `mutation UpdateStaffSubcategoryOverride(
  $accessLevels: [Int!]!
  $compareKey: UpdateStaffSubcategoryOverrideCompareKey
  $id: ID!
  $ids: [ID!]!
) {
  updateStaffSubcategoryOverride(
    accessLevels: $accessLevels
    compareKey: $compareKey
    id: $id
    ids: $ids
  )
}
` as GeneratedMutation<
  APITypes.UpdateStaffSubcategoryOverrideMutationVariables,
  APITypes.UpdateStaffSubcategoryOverrideMutation
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
