import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

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

Future<void> create(Staff staff) async {
  try {
    final request = ModelMutations.create(staff);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Add staff result: ${data.name}');
  } on ApiException catch (e) {
    debugPrint('Add staff failed: $e');
  }
}

Future<void> update(Staff staff) async {
  try {
    final request = ModelMutations.update(staff);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Update staff result: $data');
  } on ApiException catch (e) {
    debugPrint('Update staff failed: $e');
  }
}

Future<void> delete(Staff staff) async {
  try {
    final request = ModelMutations.delete(staff);
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Delete staff result: $data');
    // TODO: delete staff related resource
  } on ApiException catch (e) {
    debugPrint('Delete staff failed: $e');
  }
}
