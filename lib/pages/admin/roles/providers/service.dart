import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
RolesRepository rolesService(Ref ref) {
  return RolesRepository(
    db: ref.read(databaseAPIProvider),
    flightCrewRecordCategoriesRepository:
        ref.read(flightCrewRecordCategoriesServiceProvider),
  );
}
