import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Role> deleteRole(Role role) async {
  try {
    final List<Future> futures = [];
    role.staff?.forEach(
      (roleStaff) => futures.add(delete(roleStaff)),
    );
    futures.add(delete(role));
    await Future.wait(futures);
    return role;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Role with ${role.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Role with ${role.id} failed: $e');
    rethrow;
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
        futures.add(create(RoleStaff(role: role, staff: newStaff)));
      }
    }

    for (var oldRecord in oldMap.values) {
      futures.add(delete(oldRecord));
    }

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('update role staff failed: $e');
  }
}
