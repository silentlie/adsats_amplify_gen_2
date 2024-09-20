import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

const createNoticeOverride = '''
mutation CreateNoticeOverride(
  \$aircraft: [ID!]
  \$archived: Boolean!
  \$deadline_at: AWSDateTime
  \$details: AWSJSON!
  \$documents: [String!]
  \$noticed_at: AWSDateTime
  \$recipients: [ID!]
  \$staffId: ID!
  \$status: CreateNoticeOverrideStatus
  \$subject: String!
  \$type: CreateNoticeOverrideType
) {
  createNoticeOverride(
    aircraft: \$aircraft
    archived: \$archived
    deadline_at: \$deadline_at
    details: \$details
    documents: \$documents
    noticed_at: \$noticed_at
    recipients: \$recipients
    staffId: \$staffId
    status: \$status
    subject: \$subject
    type: \$type
  )
}
''';
const createDocumentOverride = '''
mutation CreateDocumentOverride(
  \$aircraft: [ID!]
  \$archived: Boolean!
  \$name: String!
  \$staffId: ID!
  \$subcategoryId: ID!
) {
  createDocumentOverride(
    aircraft: \$aircraft
    archived: \$archived
    name: \$name
    staffId: \$staffId
    subcategoryId: \$subcategoryId
  )
}
''';
const createStaffOverride = '''
mutation CreateStaffOverride(
  \$accessLevels: [Int!]
  \$aircraft: [ID!]
  \$archived: Boolean!
  \$email: AWSEmail!
  \$name: String!
  \$roles: [ID!]
  \$subcategories: [ID!]
) {
  createStaffOverride(
    accessLevels: \$accessLevels
    aircraft: \$aircraft
    archived: \$archived
    email: \$email
    name: \$name
    roles: \$roles
    subcategories: \$subcategories
  )
}
''';
const createSubcategoryOverride = '''
mutation CreateSubcategoryOverride(
  \$accessLevels: [Int!]
  \$archived: Boolean!
  \$categoryId: ID!
  \$description: String!
  \$name: String!
  \$staff: [ID!]
) {
  createSubcategoryOverride(
    accessLevels: \$accessLevels
    archived: \$archived
    categoryId: \$categoryId
    description: \$description
    name: \$name
    staff: \$staff
  )
}
''';
const createRoleOverride = '''
mutation createRoleOverride(
  \$archived: Boolean!
  \$description: String!
  \$name: String!
  \$staff: [ID!]
) {
  createRoleOverride(
    archived: \$archived
    description: \$description
    name: \$name
    staff: \$staff
  )
}
''';
const createAircraftOverride = '''
mutation CreateAircraftOverride(
  \$archived: Boolean!
  \$description: String!
  \$name: String!
  \$staff: [ID!]
) {
  createAircraftOverride(
    archived: \$archived
    description: \$description
    name: \$name
    staff: \$staff
  )
}
''';
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
mutation DeleteDocumentOverride(
  \$documentId: ID!,
  \$documentName: String!
) {
  deleteDocumentOverride(
    documentId: \$documentId,
    documentName: \$documentName
  )
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
Future<T> create<T extends Model>(T model) async {
  try {
    print("creating $model");
    final request = ModelMutations.create(model);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: create ${model.runtimeType} with ${model.modelIdentifier} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: create ${model.runtimeType} with ${model.modelIdentifier}failed: $e');
    rethrow;
  }
}

Future<T> update<T extends Model>(T model) async {
  try {
    print("updating $model");
    final request = ModelMutations.update(model);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: update ${model.runtimeType} with ${model.modelIdentifier} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: update ${model.runtimeType} with ${model.modelIdentifier}failed: $e');
    rethrow;
  }
}

Future<T> delete<T extends Model>(T model) async {
  try {
    print("deleting $model");
    final request = ModelMutations.delete(model);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: delete ${model.runtimeType} with ${model.modelIdentifier} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete ${model.runtimeType} with ${model.modelIdentifier}failed: $e');
    rethrow;
  }
}
