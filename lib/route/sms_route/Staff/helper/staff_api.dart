import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';

Future<String> createUser(
  String email,
  String name,
  String tempPassword,
) async {
  const document = '''
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
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: document, variables: {
        "email": email,
        "name": name,
        "temporaryPassword": tempPassword,
      }))
      .response;
  Map<String, dynamic> responseJson = jsonDecode(response.data);
  final errors = List<Map<String, dynamic>>.from(responseJson["errors"]);
  if (errors.isNotEmpty) {
    throw errors.first["message"];
  }

  String id = json.decode(responseJson["createUser"])["User"]["Username"];
  return id;
}

Future<void> diableUser(String id) async {
  const document = '''
    mutation DisableUser(
      \$id: ID!,
    ) {
      disableUser(
        id: \$id,
      )
    }
  ''';
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: document, variables: {
        "id": id,
      }))
      .response;
  Map<String, dynamic> responseJson = jsonDecode(response.data);
  final errors = List<Map<String, dynamic>>.from(responseJson["errors"]);
  if (errors.isNotEmpty) {
    throw errors.first["message"];
  }
}

Future<void> enableUser(String id) async {
  const document = '''
    mutation EnableUser(
      \$id: ID!,
    ) {
      enableUser(
        id: \$id,
      )
    }
  ''';
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: document, variables: {
        "id": id,
      }))
      .response;
  Map<String, dynamic> responseJson = jsonDecode(response.data);
  final errors = List<Map<String, dynamic>>.from(responseJson["errors"]);
  if (errors.isNotEmpty) {
    throw errors.first["message"];
  }
}

Future<void> deleteUser(String id) async {
  const document = '''
    mutation DeleteUser(
      \$id: ID!,
    ) {
      deleteUser(
        id: \$id,
      )
    }
  ''';
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: document, variables: {
        "id": id,
      }))
      .response;
  Map<String, dynamic> responseJson = jsonDecode(response.data);
  final errors = List<Map<String, dynamic>>.from(responseJson["errors"]);
  if (errors.isNotEmpty) {
    throw errors.first["message"];
  }
}
