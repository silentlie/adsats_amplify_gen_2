import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'roles.g.dart';

@Riverpod(dependencies: [AdminFilter])
Future<List<Role>> roles(Ref ref) async {
  final filter = ref.watch(adminFilterProvider);
  final service = ref.read(rolesServiceProvider);
  return await service.list(variables: {
    'filter': filter,
  });
}
