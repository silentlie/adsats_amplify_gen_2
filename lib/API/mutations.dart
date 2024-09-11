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
