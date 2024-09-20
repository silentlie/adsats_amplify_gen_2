import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<String> createUser({
  required String email,
  required String name,
  required String tempPassword,
}) async {
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

  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> responseJson = jsonDecode(response.data);
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

Future<Staff> deleteStaff(Staff staff) async {
  try {
    final request = GraphQLRequest<String>(
      document: getStaffDetails,
      variables: {"id": staff.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    Staff returnStaff = Staff.fromJson(jsonMap["getStaff"]);
    final List<Future> futures = [];
    returnStaff.aircraft?.forEach(
      (aircraftStaff) => futures.add(delete(aircraftStaff)),
    );
    returnStaff.roles?.forEach(
      (roleStaff) => futures.add(delete(roleStaff)),
    );
    returnStaff.subcategories?.forEach(
      (staffSubcategory) => futures.add(delete(staffSubcategory)),
    );
    returnStaff.notifications?.forEach(
      (notification) => futures.add(delete(notification)),
    );
    futures.add(delete(staff));
    Future.wait(futures);
    return staff;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Staff with ${staff.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: delete Staff with ${staff.id} failed: $e');
    rethrow;
  }
}

Future<void> updateAircraftStaff(Staff staff, List<Aircraft> aircraft) async {
  try {
    final List<Future> futures = [];
    final oldRecords = staff.aircraft ?? [];
    final Map<String, AircraftStaff> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.aircraft!.id: oldRecord
    };
    for (var newAircraft in aircraft) {
      final oldRecord = oldMap.remove(newAircraft.id);
      if (oldRecord == null) {
        futures.add(create(AircraftStaff(staff: staff, aircraft: newAircraft)));
      }
    }
    for (var oldRecord in oldMap.values) {
      futures.add(delete(oldRecord));
    }
    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('ApiExecption: update AircraftStaff failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: update AircraftStaff failed: $e');
    rethrow;
  }
}

Future<void> updateRoleStaff(Staff staff, List<Role> roles) async {
  try {
    final List<Future> futures = [];
    final oldRecords = staff.roles ?? [];
    final Map<String, RoleStaff> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.role!.id: oldRecord
    };

    for (var newRole in roles) {
      final oldRecord = oldMap.remove(newRole.id);
      if (oldRecord == null) {
        futures.add(create(RoleStaff(staff: staff, role: newRole)));
      }
    }

    for (var oldRecord in oldMap.values) {
      futures.add(delete(oldRecord));
    }

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('ApiExecption: update RoleStaff failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: update RoleStaff failed: $e');
    rethrow;
  }
}

Future<void> updateStaffSubcategory(
    Staff staff, Map<Subcategory, StaffSubcategory> staffSubcategories) async {
  try {
    final oldRecords = staff.subcategories ?? [];
    if (oldRecords.isEmpty && staffSubcategories.isEmpty) {
      return;
    }
    if (oldRecords.isEmpty) {
      await Future.wait(
        staffSubcategories.values
            .map((newRecord) => create(newRecord.copyWith(staff: staff))),
      );
      return;
    } else if (staffSubcategories.isEmpty) {
      await Future.wait(
        oldRecords.map((oldRecord) => delete(oldRecord)),
      );
      return;
    }
    final List<Future> futures = [];
    for (var oldRecord in oldRecords) {
      final newRecord = staffSubcategories.remove(oldRecord.subcategory);
      if (newRecord == null) {
        futures.add(delete(oldRecord));
      } else if (newRecord.accessLevel != oldRecord.accessLevel) {
        futures.add(update(newRecord));
      }
    }
    for (var newRecord in staffSubcategories.values) {
      futures.add(create(newRecord.copyWith(staff: staff)));
    }
    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('ApiExecption: update RoleStaff failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: update RoleStaff failed: $e');
    rethrow;
  }
}
