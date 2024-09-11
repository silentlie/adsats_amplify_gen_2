const deleteCategoryOverride = '''
mutation DeleteCategoryOverride(\$categoryId: ID!) {
  deleteCategoryOverride(categoryId: \$categoryId)
}
''';
const deleteSubcategoryOverride = '''
mutation DeleteSubcategoryOverride(\$subcategoryId: ID!) {
  deleteSubcategoryOverride(subcategoryId: \$subcategoryId)
}
''';
const deleteRoleOverride = '''
mutation DeleteRoleOverride(\$roleId: ID!) {
  deleteRoleOverride(roleId: \$roleId)
}
''';
const deleteAircraftOverride = '''
mutation DeleteAircraftOverride(\$aircraftId: ID!) {
  deleteAircraftOverride(aircraftId: \$aircraftId)
}
''';
const deleteStaffOverride = '''
mutation DeleteStaffOverride(\$staffId: ID!) {
  deleteStaffOverride(staffId: \$staffId)
}
''';
const deleteDocumentOverride = '''
mutation DeleteDocumentOverride(\$documentId: ID!, \$documentName: String!) {
  deleteDocumentOverride(documentId: \$documentId, documentName: \$documentName)
}
''';
const deleteNoticeOverride = '''
mutation DeleteNoticeOverride(\$noticeId: ID!) {
  deleteNoticeOverride(noticeId: \$noticeId)
}
''';
const deleteNoticeDocumentOverride = '''
mutation DeleteNoticeDocumentOverride(
  \$noticeDocumentId: ID!
  \$noticeDocumentName: String!
) {
  deleteNoticeDocumentOverride(
    noticeDocumentId: \$noticeDocumentId
    noticeDocumentName: \$noticeDocumentName
  )
}
''';
const createUserAdmin = '''
mutation CreateUser(
  \$email: AWSEmail!,
  \$name: String!
  \$temporaryPassword: String!
) {
  createUser(
    email: \$email,
    name: \$name,
    temporaryPassword: \$temporaryPassword
  )
}
''';
const deleteUserAdmin = '''
mutation DeleteUser(\$id: ID!) {
  deleteUser(id: \$id)
}
''';
const enableUserAdmin = '''
mutation EnableUser(\$id: ID!) {
  enableUser(id: \$id)
}
''';
const disableUserAdmin = '''
mutation DisableUser(\$id: ID!) {
  disableUser(id: \$id)
}
''';
