import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

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
Future<T> create<T extends Model>(T model) async {
  try {
    final request = ModelMutations.create(model);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint(
        'ApiException: create ${model.runtimeType} with ${model.modelIdentifier} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: create ${model.runtimeType} with ${model.modelIdentifier}failed: $e');
    rethrow;
  }
}

Future<T> update<T extends Model>(T model) async {
  try {
    final request = ModelMutations.update(model);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint(
        'ApiException: update ${model.runtimeType} with ${model.modelIdentifier} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: update ${model.runtimeType} with ${model.modelIdentifier}failed: $e');
    rethrow;
  }
}

Future<T> delete<T extends Model>(T model) async {
  try {
    final request = ModelMutations.delete(model);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint(
        'ApiException: delete ${model.runtimeType} with ${model.modelIdentifier} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete ${model.runtimeType} with ${model.modelIdentifier}failed: $e');
    rethrow;
  }
}
