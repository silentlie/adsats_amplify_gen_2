import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
AircraftRepository aircraftService(
  Ref ref,
) {
  return AircraftRepository(
    db: ref.read(databaseAPIProvider),
  );
}
