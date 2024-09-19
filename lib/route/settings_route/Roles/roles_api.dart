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
    // print('Update role result: $data');
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

Future<void> createRoleStaff(RoleStaff roleStaff) async {
  try {
    final request = ModelMutations.create(roleStaff);
    final response = await Amplify.API.mutate(request: request).response;

    final createdRoleStaff = response.data;
    if (createdRoleStaff == null) {
      debugPrint('Error creating role staff: ${response.errors}');
      return;
    }
  } on ApiException catch (e) {
    debugPrint('Create role staff failed: $e');
  }
}

Future<void> deleteRoleStaff(RoleStaff roleStaff) async {
  try {
    final request = ModelMutations.delete(roleStaff);
    final response = await Amplify.API.mutate(request: request).response;

    final deletedRoleStaff = response.data;
    if (deletedRoleStaff == null) {
      debugPrint('Error deleting role staff: ${response.errors}');
      return;
    }
  } on ApiException catch (e) {
    debugPrint('Delete role staff failed: $e');
  }
}

Future<void> updateRoleStaff(Role role, List<Staff> staff) async {
  try {
    final List<Future> futures = [];
    final oldRecords = role.staff ?? [];
    final Map<String, RoleStaff> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.staff!.id: oldRecord
    };

    for (var newStaff in staff) {
      final oldRecord = oldMap.remove(newStaff.id);
      if (oldRecord == null) {
        futures.add(createRoleStaff(RoleStaff(role: role, staff: newStaff)));
      }
    }

    for (var oldRecord in oldMap.values) {
      futures.add(deleteRoleStaff(oldRecord));
    }

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('update role staff failed: $e');
  }
}
