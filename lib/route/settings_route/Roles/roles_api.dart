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
    final request = ModelMutations.delete(role);
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    await deleteRoleStaff(role.staff ?? []);
    // print('Delete role result: $data');
  } on ApiException catch (e) {
    debugPrint('Delete role failed: $e');
  }
}

Future<void> createRoleStaff(List<RoleStaff> staffList) async {
  try {
    final futures = staffList.map((staff) async {
      final request = ModelMutations.create(staff);
      final response = await Amplify.API.mutate(request: request).response;

      final createdRoleStaff = response.data;
      if (createdRoleStaff == null) {
        debugPrint('Error creating role staff: ${response.errors}');
        return;
      }
    }).toList();

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('Create role staff failed: $e');
  }
}

Future<void> deleteRoleStaff(List<RoleStaff> staffList) async {
  try {
    final futures = staffList.map((staff) async {
      final request = ModelMutations.delete(staff);
      final response = await Amplify.API.mutate(request: request).response;

      final deletedRoleStaff = response.data;
      if (deletedRoleStaff == null) {
        debugPrint('Error deleting role staff: ${response.errors}');
        return;
      }
    }).toList();

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('Delete role staff failed: $e');
  }
}
