import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aircraft.g.dart';

@Riverpod(dependencies: [AdminFilter])
Future<List<Aircraft>> aircraft(Ref ref) async {
  final service = ref.read(aircraftServiceProvider);
  final filter = ref.watch(adminFilterProvider);
  return service.list(variables: {
    'filter': filter,
  });
}
