/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

import * as APITypes from "./API";
type GeneratedQuery<InputType, OutputType> = string & {
  __generatedQueryInput: InputType;
  __generatedQueryOutput: OutputType;
};

export const getAircraft = /* GraphQL */ `query GetAircraft($id: ID!) {
  getAircraft(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetAircraftQueryVariables,
  APITypes.GetAircraftQuery
>;
export const getAircraftDocument = /* GraphQL */ `query GetAircraftDocument($id: ID!) {
  getAircraftDocument(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetAircraftDocumentQueryVariables,
  APITypes.GetAircraftDocumentQuery
>;
export const getAircraftNotice = /* GraphQL */ `query GetAircraftNotice($id: ID!) {
  getAircraftNotice(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetAircraftNoticeQueryVariables,
  APITypes.GetAircraftNoticeQuery
>;
export const getAircraftStaff = /* GraphQL */ `query GetAircraftStaff($id: ID!) {
  getAircraftStaff(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetAircraftStaffQueryVariables,
  APITypes.GetAircraftStaffQuery
>;
export const getCategory = /* GraphQL */ `query GetCategory($id: ID!) {
  getCategory(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetCategoryQueryVariables,
  APITypes.GetCategoryQuery
>;
export const getDocument = /* GraphQL */ `query GetDocument($id: ID!) {
  getDocument(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetDocumentQueryVariables,
  APITypes.GetDocumentQuery
>;
export const getNotice = /* GraphQL */ `query GetNotice($id: ID!) {
  getNotice(id: $id) {
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
` as GeneratedQuery<APITypes.GetNoticeQueryVariables, APITypes.GetNoticeQuery>;
export const getNoticeDocument = /* GraphQL */ `query GetNoticeDocument($id: ID!) {
  getNoticeDocument(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetNoticeDocumentQueryVariables,
  APITypes.GetNoticeDocumentQuery
>;
export const getNotification = /* GraphQL */ `query GetNotification($id: ID!) {
  getNotification(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetNotificationQueryVariables,
  APITypes.GetNotificationQuery
>;
export const getRole = /* GraphQL */ `query GetRole($id: ID!) {
  getRole(id: $id) {
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
` as GeneratedQuery<APITypes.GetRoleQueryVariables, APITypes.GetRoleQuery>;
export const getRoleStaff = /* GraphQL */ `query GetRoleStaff($id: ID!) {
  getRoleStaff(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetRoleStaffQueryVariables,
  APITypes.GetRoleStaffQuery
>;
export const getStaff = /* GraphQL */ `query GetStaff($id: String!) {
  getStaff(id: $id) {
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
` as GeneratedQuery<APITypes.GetStaffQueryVariables, APITypes.GetStaffQuery>;
export const getStaffSubcategory = /* GraphQL */ `query GetStaffSubcategory($id: ID!) {
  getStaffSubcategory(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetStaffSubcategoryQueryVariables,
  APITypes.GetStaffSubcategoryQuery
>;
export const getSubcategory = /* GraphQL */ `query GetSubcategory($id: ID!) {
  getSubcategory(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetSubcategoryQueryVariables,
  APITypes.GetSubcategoryQuery
>;
export const listAircraft = /* GraphQL */ `query ListAircraft(
  $filter: ModelAircraftFilterInput
  $limit: Int
  $nextToken: String
) {
  listAircraft(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListAircraftQueryVariables,
  APITypes.ListAircraftQuery
>;
export const listAircraftByName = /* GraphQL */ `query ListAircraftByName(
  $filter: ModelAircraftFilterInput
  $limit: Int
  $name: String!
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listAircraftByName(
    filter: $filter
    limit: $limit
    name: $name
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListAircraftByNameQueryVariables,
  APITypes.ListAircraftByNameQuery
>;
export const listAircraftDocuments = /* GraphQL */ `query ListAircraftDocuments(
  $filter: ModelAircraftDocumentFilterInput
  $limit: Int
  $nextToken: String
) {
  listAircraftDocuments(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      aircraftId
      createdAt
      documentId
      id
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListAircraftDocumentsQueryVariables,
  APITypes.ListAircraftDocumentsQuery
>;
export const listAircraftNotices = /* GraphQL */ `query ListAircraftNotices(
  $filter: ModelAircraftNoticeFilterInput
  $limit: Int
  $nextToken: String
) {
  listAircraftNotices(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      aircraftId
      createdAt
      id
      noticeId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListAircraftNoticesQueryVariables,
  APITypes.ListAircraftNoticesQuery
>;
export const listAircraftStaffs = /* GraphQL */ `query ListAircraftStaffs(
  $filter: ModelAircraftStaffFilterInput
  $limit: Int
  $nextToken: String
) {
  listAircraftStaffs(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      aircraftId
      createdAt
      id
      staffId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListAircraftStaffsQueryVariables,
  APITypes.ListAircraftStaffsQuery
>;
export const listCategories = /* GraphQL */ `query ListCategories(
  $filter: ModelCategoryFilterInput
  $limit: Int
  $nextToken: String
) {
  listCategories(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListCategoriesQueryVariables,
  APITypes.ListCategoriesQuery
>;
export const listCategoryByName = /* GraphQL */ `query ListCategoryByName(
  $filter: ModelCategoryFilterInput
  $limit: Int
  $name: String!
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listCategoryByName(
    filter: $filter
    limit: $limit
    name: $name
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListCategoryByNameQueryVariables,
  APITypes.ListCategoryByNameQuery
>;
export const listDocumentByName = /* GraphQL */ `query ListDocumentByName(
  $filter: ModelDocumentFilterInput
  $limit: Int
  $name: String!
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listDocumentByName(
    filter: $filter
    limit: $limit
    name: $name
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      createdAt
      id
      name
      staffId
      subcategoryId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListDocumentByNameQueryVariables,
  APITypes.ListDocumentByNameQuery
>;
export const listDocuments = /* GraphQL */ `query ListDocuments(
  $filter: ModelDocumentFilterInput
  $limit: Int
  $nextToken: String
) {
  listDocuments(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      archived
      createdAt
      id
      name
      staffId
      subcategoryId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListDocumentsQueryVariables,
  APITypes.ListDocumentsQuery
>;
export const listNoticeBySubject = /* GraphQL */ `query ListNoticeBySubject(
  $filter: ModelNoticeFilterInput
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
  $subject: String!
) {
  listNoticeBySubject(
    filter: $filter
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
    subject: $subject
  ) {
    items {
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
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListNoticeBySubjectQueryVariables,
  APITypes.ListNoticeBySubjectQuery
>;
export const listNoticeDocuments = /* GraphQL */ `query ListNoticeDocuments(
  $filter: ModelNoticeDocumentFilterInput
  $limit: Int
  $nextToken: String
) {
  listNoticeDocuments(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      createdAt
      id
      name
      noticeId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListNoticeDocumentsQueryVariables,
  APITypes.ListNoticeDocumentsQuery
>;
export const listNotices = /* GraphQL */ `query ListNotices(
  $filter: ModelNoticeFilterInput
  $limit: Int
  $nextToken: String
) {
  listNotices(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
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
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListNoticesQueryVariables,
  APITypes.ListNoticesQuery
>;
export const listNotifications = /* GraphQL */ `query ListNotifications(
  $filter: ModelNotificationFilterInput
  $limit: Int
  $nextToken: String
) {
  listNotifications(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      createdAt
      id
      noticeId
      read_at
      staffId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListNotificationsQueryVariables,
  APITypes.ListNotificationsQuery
>;
export const listRoleByName = /* GraphQL */ `query ListRoleByName(
  $filter: ModelRoleFilterInput
  $limit: Int
  $name: String!
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listRoleByName(
    filter: $filter
    limit: $limit
    name: $name
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListRoleByNameQueryVariables,
  APITypes.ListRoleByNameQuery
>;
export const listRoleStaffs = /* GraphQL */ `query ListRoleStaffs(
  $filter: ModelRoleStaffFilterInput
  $limit: Int
  $nextToken: String
) {
  listRoleStaffs(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      createdAt
      id
      roleId
      staffId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListRoleStaffsQueryVariables,
  APITypes.ListRoleStaffsQuery
>;
export const listRoles = /* GraphQL */ `query ListRoles(
  $filter: ModelRoleFilterInput
  $limit: Int
  $nextToken: String
) {
  listRoles(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      archived
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<APITypes.ListRolesQueryVariables, APITypes.ListRolesQuery>;
export const listStaff = /* GraphQL */ `query ListStaff(
  $filter: ModelStaffFilterInput
  $id: String
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listStaff(
    filter: $filter
    id: $id
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<APITypes.ListStaffQueryVariables, APITypes.ListStaffQuery>;
export const listStaffByEmail = /* GraphQL */ `query ListStaffByEmail(
  $email: AWSEmail!
  $filter: ModelStaffFilterInput
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listStaffByEmail(
    email: $email
    filter: $filter
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      createdAt
      email
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListStaffByEmailQueryVariables,
  APITypes.ListStaffByEmailQuery
>;
export const listStaffSubcategories = /* GraphQL */ `query ListStaffSubcategories(
  $filter: ModelStaffSubcategoryFilterInput
  $limit: Int
  $nextToken: String
) {
  listStaffSubcategories(
    filter: $filter
    limit: $limit
    nextToken: $nextToken
  ) {
    items {
      accessLevel
      createdAt
      id
      staffId
      subcategoryId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListStaffSubcategoriesQueryVariables,
  APITypes.ListStaffSubcategoriesQuery
>;
export const listSubcategories = /* GraphQL */ `query ListSubcategories(
  $filter: ModelSubcategoryFilterInput
  $limit: Int
  $nextToken: String
) {
  listSubcategories(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListSubcategoriesQueryVariables,
  APITypes.ListSubcategoriesQuery
>;
export const listSubcategoryByName = /* GraphQL */ `query ListSubcategoryByName(
  $filter: ModelSubcategoryFilterInput
  $limit: Int
  $name: String!
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listSubcategoryByName(
    filter: $filter
    limit: $limit
    name: $name
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      archived
      categoryId
      createdAt
      description
      id
      name
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListSubcategoryByNameQueryVariables,
  APITypes.ListSubcategoryByNameQuery
>;
export const listUsers = /* GraphQL */ `query ListUsers(
  $attributesToGet: [String!]
  $filter: String
  $limit: Int
  $paginationToken: String
) {
  listUsers(
    attributesToGet: $attributesToGet
    filter: $filter
    limit: $limit
    paginationToken: $paginationToken
  )
}
` as GeneratedQuery<APITypes.ListUsersQueryVariables, APITypes.ListUsersQuery>;
