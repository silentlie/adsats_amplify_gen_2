const sendEmailDocument = '''
mutation SendEmail(
  \$subject: String!,
  \$recipients: [String!]!,
  \$htmlBody: String!,
  \$author: String
) {
  sendEmail(
    recipients: \$recipients
    subject: \$subject
    htmlBody: \$htmlBody
    author: \$author
  )
}
''';
const createUserAdmin = '''
mutation CreateUser(
  \$email: AWSEmail!,
  \$temporaryPassword: String!
) {
  createUser(
    email: \$email,
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
