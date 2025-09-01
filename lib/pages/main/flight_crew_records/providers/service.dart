import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/helper/providers/storage_api.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
FlightCrewRecordsRepository recordsService(Ref ref) {
  return FlightCrewRecordsRepository(
    db: ref.read(databaseAPIProvider),
    storage: ref.read(storageAPIProvider),
  );
}
