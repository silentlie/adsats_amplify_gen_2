import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'records.g.dart';

@Riverpod(dependencies: [FlightCrewRecordCategoriesFilter])
Future<Role> flightCrewRecordCategories(
  Ref ref,
  String roleId,
) async {
  final filter = ref.watch(flightCrewRecordCategoriesFilterProvider(roleId));
  return await ref
      .read(flightCrewRecordCategoriesServiceProvider)
      .list(variables: {
    "filter": filter,
    "id": filter.roleId,
  });
}
