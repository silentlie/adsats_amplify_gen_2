import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<String> createUser(
  String email,
  String name,
  String tempPassword,
) async {
  final response = await Amplify.API
      .query(
        request: GraphQLRequest(
          document: createUserAdmin,
          variables: {
            "email": email,
            "name": name,
            "temporaryPassword": tempPassword,
          },
        ),
      )
      .response;
  Map<String, dynamic> responseJson = jsonDecode(response.data);
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  String id = json.decode(responseJson["createUser"])["User"]["Username"];
  return id;
}

Future<void> disableUser(String id) async {
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: disableUserAdmin, variables: {
        "id": id,
      }))
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
}

Future<void> enableUser(String id) async {
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: enableUserAdmin, variables: {
        "id": id,
      }))
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
}

Future<void> deleteUser(String id) async {
  final response = await Amplify.API
      .query(
          request: GraphQLRequest(document: deleteUserAdmin, variables: {
        "id": id,
      }))
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
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
    final request = GraphQLRequest<String>(
      document: deleteStaffOverride,
      variables: {"staffId": staff.id},
    );
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Delete staff result: $data');
  } on ApiException catch (e) {
    debugPrint('Delete staff failed: $e');
  }
}
