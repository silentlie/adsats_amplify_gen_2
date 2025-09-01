import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/data/repository.dart';

class FlightCrewRecordCategoriesRepository {
  final AmplifyAppSyncAPI _db;
  final FlightCrewRecordsRepository _flightCrewRecordsRepository;

  FlightCrewRecordCategoriesRepository({
    required AmplifyAppSyncAPI db,
    required FlightCrewRecordsRepository flightCrewRecordsRepository,
  })  : _db = db,
        _flightCrewRecordsRepository = flightCrewRecordsRepository;

  Future<Role> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listFlightCrewRecordCategoriesGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return Role.fromJson(res['getRole']);
  }

  Future<FlightCrewRecordCategory> create(
      FlightCrewRecordCategory category) async {
    return await _db.create(category);
  }

  Future<FlightCrewRecordCategory> update(
      FlightCrewRecordCategory category) async {
    return await _db.update(category);
  }

  Future<FlightCrewRecordCategory> archive(
      FlightCrewRecordCategory category) async {
    return await _db.update(category.copyWith(archived: !category.archived));
  }

  Future<FlightCrewRecordCategory> delete(
      FlightCrewRecordCategory category) async {
    final res = await _db.query(
      document: getFlightCrewRecordsCategoryDetailsGraphQL,
      variables: {"id": category.id},
    );
    category =
        FlightCrewRecordCategory.fromJson(res['getFlightCrewRecordCategory']);
    final List<Future> futures =
        category.flightCrewRecords?.map((flightCrewRecord) {
              return _flightCrewRecordsRepository.delete(flightCrewRecord);
            }).toList() ??
            [];
    await Future.wait(futures);
    return await _db.delete(category);
  }
}
