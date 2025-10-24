import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'records.g.dart';

@riverpod
Future<List<FlightCrewRecord>> records(
  Ref ref,
  Staff staff,
  FlightCrewRecordCategory category,
) async {
  final filter = ref.watch(flightCrewRecordFilterProvider(
    staff,
    category,
  ));
  final service = ref.read(recordsServiceProvider);
  return await service.list(
    variables: {
      "filter": filter.toJson(),
    },
  );
}

@riverpod
Future<(Iterable<Aircraft>, Iterable<Role>)> recordMeta(Ref ref) async {
  final service = ref.read(recordsServiceProvider);
  return await service.meta();
}

@riverpod
Future<Iterable<Staff>> joinStaff(Ref ref, Aircraft aircraft, Role role) async {
  final service = ref.read(recordsServiceProvider);
  return await service.listJoinStaff(aircraft: aircraft, role: role);
}
