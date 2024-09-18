import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<void> create(Role role) async {
  try {
    final request = ModelMutations.create(role);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Add role result: ${data.name}');
  } on ApiException catch (e) {
    debugPrint('Add role failed: $e');
  }
}

Future<void> update(Role role) async {
  try {
    final request = ModelMutations.update(role);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    print('Update role result: $data');
  } on ApiException catch (e) {
    debugPrint('Update role failed: $e');
  }
}

Future<void> delete(Role role) async {
  try {
    final request = GraphQLRequest<String>(
      document: deleteRoleOverride,
      variables: {"roleId": role.id},
    );
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Delete role result: $data');
  } on ApiException catch (e) {
    debugPrint('Delete role failed: $e');
  }
}

Future<void> updateRoleStaff(
  String noticeId,
  List<String> newStaffIds,
  List<String> oldStaffIds,
) async {
  try {
    print(newStaffIds);
    print(oldStaffIds);
    final request = GraphQLRequest<String>(
      document: updateRoleStaffOverride,
      variables: {
        "compareKey": "STAFF",
        "id": noticeId,
        "ids": newStaffIds,
      },
    );
    final response = await Amplify.API.query(request: request).response;
    print(response);
    if (response.data == null) {
      throw Exception('No data returned from API');
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    debugPrint(jsonMap.toString());
    final updateRoleStaffOverrideResult = jsonMap["updateRoleStaffOverride"];
    debugPrint(updateRoleStaffOverrideResult);
  } on ApiException catch (e) {
    debugPrint('Create role staff failed: $e');
  }
}
