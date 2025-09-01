import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/data/repository.dart';

class RolesRepository {
  final AmplifyAppSyncAPI _db;
  final FlightCrewRecordCategoriesRepository
      _flightCrewRecordCategoriesRepository;

  RolesRepository({
    required AmplifyAppSyncAPI db,
    required FlightCrewRecordCategoriesRepository
        flightCrewRecordCategoriesRepository,
  })  : _db = db,
        _flightCrewRecordCategoriesRepository =
            flightCrewRecordCategoriesRepository;

  Future<List<Role>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listRolesGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res['listRoles']['items'] as List)
        .map((e) => Role.fromJson(e))
        .toList();
  }

  Future<Role> create(Role role, List<Staff> staff) async {
    await upsertRoleStaff(role, staff);
    return await _db.create(role);
  }

  Future<Role> update(Role role, List<Staff> staff) async {
    await upsertRoleStaff(role, staff);
    return await _db.update(role);
  }

  Future<Role> archive(Role role) async {
    return await _db.update(role.copyWith(archived: !role.archived));
  }

  Future<Role> delete(Role role) async {
    final List<Future> futures = [];
    role.staff?.forEach(
      (roleStaff) => futures.add(_db.delete(roleStaff)),
    );
    for (var category in role.categories!) {
      futures.add(_flightCrewRecordCategoriesRepository.delete(category));
    }
    await Future.wait(futures);
    return await _db.delete(role);
  }

  Future<void> upsertRoleStaff(Role role, List<Staff> staff) async {
    final List<Future> futures = [];
    final Map<String, RoleStaff> oldMap = {
      for (var ole in role.staff ?? []) ole.staff!.id: ole
    };

    for (var newStaff in staff) {
      final old = oldMap.remove(newStaff.id);
      if (old == null) {
        futures.add(_db.create(RoleStaff(
          role: role,
          staff: newStaff,
        )));
      }
    }

    for (var old in oldMap.values) {
      futures.add(_db.delete(old));
    }

    await Future.wait(futures);
  }
}
