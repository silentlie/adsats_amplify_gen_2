import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'staff.g.dart';

@Riverpod(dependencies: [AdminFilter])
Future<List<Staff>> staff(Ref ref) async {
  final filter = ref.watch(adminFilterProvider);
  final service = ref.read(staffServiceProvider);
  return await service.list(variables: {
    'filter': filter.toJson(),
  });
}
