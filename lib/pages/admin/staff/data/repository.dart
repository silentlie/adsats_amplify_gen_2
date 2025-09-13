import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

class StaffRepository {
  final AmplifyAppSyncAPI _db;

  StaffRepository({
    required AmplifyAppSyncAPI db,
  }) : _db = db;

  Future<List<Staff>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listStaffGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res['listStaff']['items'] as List)
        .map((e) => Staff.fromJson(e))
        .toList();
  }

  Future<Staff> create(Staff staff, List<Aircraft> aircraft, List<Role> roles,
      Map<Subcategory, StaffSubcategory> staffSubcategories) async {
    final user = await createUser(
      email: staff.email,
      tempPassword: "LM00r3??",
    );
    Map<String, dynamic> userData = user["User"];
    String id = userData["Username"];
    staff = Staff(
      id: id,
      firstName: staff.firstName,
      lastName: staff.lastName,
      email: staff.email,
      archived: staff.archived,
    );
    final futures = <Future>[];
    if (staff.archived) {
      futures.add(disableUser(staff));
    } else {
      futures.add(enableUser(staff));
    }
    futures.add(upsertAircraftStaff(staff, aircraft));
    futures.add(upsertRoleStaff(staff, roles));
    futures.add(upsertSubcategoryStaff(staff, staffSubcategories));
    await Future.wait(futures);
    return await _db.create(staff);
  }

  Future<void> upsertAircraftStaff(Staff staff, List<Aircraft> aircraft) async {
    final List<Future> futures = [];
    final oldRecords = staff.aircraft ?? [];
    final Map<String, AircraftStaff> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.aircraft!.id: oldRecord
    };
    for (var newAircraft in aircraft) {
      final oldRecord = oldMap.remove(newAircraft.id);
      if (oldRecord == null) {
        futures.add(
            _db.create(AircraftStaff(staff: staff, aircraft: newAircraft)));
      }
    }
    for (var oldRecord in oldMap.values) {
      futures.add(_db.delete(oldRecord));
    }
    await Future.wait(futures);
  }

  Future<void> upsertRoleStaff(Staff staff, List<Role> roles) async {
    final List<Future> futures = [];
    final oldRecords = staff.roles ?? [];
    final Map<String, RoleStaff> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.role!.id: oldRecord
    };

    for (var newRole in roles) {
      final oldRecord = oldMap.remove(newRole.id);
      if (oldRecord == null) {
        futures.add(_db.create(RoleStaff(staff: staff, role: newRole)));
      }
    }

    for (var oldRecord in oldMap.values) {
      futures.add(_db.delete(oldRecord));
    }

    await Future.wait(futures);
  }

  Future<void> upsertSubcategoryStaff(Staff staff,
      Map<Subcategory, StaffSubcategory> staffSubcategories) async {
    final oldRecords = staff.subcategories ?? [];
    if (oldRecords.isEmpty && staffSubcategories.isEmpty) {
      return;
    }
    if (oldRecords.isEmpty) {
      await Future.wait(
        staffSubcategories.values
            .map((newRecord) => _db.create(newRecord.copyWith(staff: staff))),
      );
      return;
    } else if (staffSubcategories.isEmpty) {
      await Future.wait(
        oldRecords.map((oldRecord) => _db.delete(oldRecord)),
      );
      return;
    }
    final List<Future> futures = [];
    for (var oldRecord in oldRecords) {
      final newRecord = staffSubcategories.remove(oldRecord.subcategory);
      if (newRecord == null) {
        futures.add(_db.delete(oldRecord));
      } else if (newRecord.accessLevel != oldRecord.accessLevel) {
        futures.add(_db.update(newRecord));
      }
    }
    for (var newRecord in staffSubcategories.values) {
      futures.add(_db.create(newRecord.copyWith(staff: staff)));
    }
    await Future.wait(futures);
  }

  Future<Staff> update(
    Staff staff,
    List<Aircraft> aircraft,
    List<Role> roles,
    Map<Subcategory, StaffSubcategory> staffSubcategories,
  ) async {
    final futures = <Future>[];
    if (staff.archived) {
      futures.add(disableUser(staff));
    } else {
      futures.add(enableUser(staff));
    }
    futures.add(upsertAircraftStaff(staff, aircraft));
    futures.add(upsertRoleStaff(staff, roles));
    futures.add(upsertSubcategoryStaff(staff, staffSubcategories));
    await Future.wait(futures);
    return await _db.update(staff);
  }

  Future<Staff> archive(Staff staff) async {
    final archive = !staff.archived;
    if (archive) {
      await enableUser(staff);
    } else {
      await disableUser(staff);
    }
    return await _db.update(staff.copyWith(archived: archive));
  }

  Future<Staff> delete(Staff staff) async {
    final res = await _db.query(
      document: getStaffDetailsGraphQL,
      variables: {
        "id": staff.id,
      },
    );
    staff = Staff.fromJson(res['getStaff']);
    await disableUser(staff);
    final futures = <Future>[];
    staff.aircraft?.forEach(
      (aircraftStaff) => futures.add(_db.delete(aircraftStaff)),
    );
    staff.roles?.forEach(
      (roleStaff) => futures.add(_db.delete(roleStaff)),
    );
    staff.subcategories?.forEach(
      (staffSubcategory) => futures.add(_db.delete(staffSubcategory)),
    );
    staff.notifications?.forEach(
      (notification) => futures.add(_db.delete(notification)),
    );
    staff.reportNotifications?.forEach(
      (notification) => futures.add(_db.delete(notification)),
    );
    staff.sessions?.forEach(
      (session) => futures.add(_db.delete(session)),
    );
    futures.add(deleteUser(staff));
    await Future.wait(futures);
    return await _db.delete(staff);
  }

  // May need to move these into their own repository

  Future<Map<String, dynamic>> createUser({
    required String email,
    required String tempPassword,
  }) async {
    return await _db.mutate(
      document: createUserAdmin,
      variables: {
        "email": email,
        "temporaryPassword": tempPassword,
      },
    ).then((value) => jsonDecode(value["createUser"]));
  }

  Future<Map<String, dynamic>> enableUser(Staff staff) async {
    return await _db.mutate(
      document: enableUserAdmin,
      variables: {'id': staff.id},
    ).then((value) => jsonDecode(value["enableUser"]));
  }

  Future<Map<String, dynamic>> disableUser(Staff staff) async {
    return await _db.mutate(
      document: disableUserAdmin,
      variables: {'id': staff.id},
    ).then((value) => jsonDecode(value["disableUser"]));
  }

  Future<Map<String, dynamic>> deleteUser(Staff staff) async {
    return await _db.mutate(
      document: deleteUserAdmin,
      variables: {'id': staff.id},
    ).then((value) => jsonDecode(value["deleteUser"]));
  }
}
