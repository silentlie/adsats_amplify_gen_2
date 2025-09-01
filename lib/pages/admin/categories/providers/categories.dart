import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories.g.dart';

@Riverpod(dependencies: [AdminFilter])
Future<List<Category>> categories(Ref ref) async {
  final filter = ref.watch(adminFilterProvider);
  final service = ref.read(categoriesServiceProvider);
  return service.list(variables: {
    'filter': filter,
  });
}
