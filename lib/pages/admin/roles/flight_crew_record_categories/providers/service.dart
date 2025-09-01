import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod()
FlightCrewRecordCategoriesRepository flightCrewRecordCategoriesService(
  Ref ref,
) {
  return FlightCrewRecordCategoriesRepository(
    db: ref.read(databaseAPIProvider),
    flightCrewRecordsRepository: ref.read(recordsServiceProvider),
  );
}
