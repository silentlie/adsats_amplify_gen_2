import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

class AircraftRepository {
  final AmplifyAppSyncAPI _db;

  AircraftRepository({
    required AmplifyAppSyncAPI db,
  }) : _db = db;

  Future<List<Aircraft>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listAircraftGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res['listAircraft']['items'] as List)
        .map((e) => Aircraft.fromJson(e))
        .toList();
  }

  Future<Aircraft> delete(Aircraft aircraft) async {
    final res = await _db.query(
        document: getAircraftDetailsGraphQL, variables: {'id': aircraft.id});
    aircraft = Aircraft.fromJson(res['getAircraft']);
    final List<Future> futures = [];
    aircraft.staff?.forEach(
      (aircraftStaff) => futures.add(_db.delete(aircraftStaff)),
    );
    aircraft.document?.forEach(
      (aircraftDocument) => futures.add(_db.delete(aircraftDocument)),
    );
    aircraft.notices?.forEach(
      (aircraftNotice) => futures.add(_db.delete(aircraftNotice)),
    );
    await Future.wait(futures);
    return aircraft;
  }

  Future<Aircraft> update(Aircraft aircraft) async {
    return _db.update(aircraft);
  }

  Future<Aircraft> create(Aircraft aircraft) async {
    return _db.create(aircraft);
  }

  Future<Aircraft> archive(Aircraft aircraft) async {
    return _db.update(aircraft.copyWith(archived: !aircraft.archived));
  }

  Future<void> upsertAircraftStaff(Aircraft aircraft, List<Staff> staff) async {
    final futures = <Future>[];
    final Map<String, AircraftStaff> oldMap = {
      for (var old in aircraft.staff ?? <AircraftStaff>[]) old.id: old
    };
    for (final newStaff in staff) {
      final old = oldMap.remove(newStaff.id);
      if (old == null) {
        futures.add(
            _db.create(AircraftStaff(aircraft: aircraft, staff: newStaff)));
      }
    }
    for (final old in oldMap.values) {
      futures.add(_db.delete(old));
    }
    await Future.wait(futures);
  }
}
