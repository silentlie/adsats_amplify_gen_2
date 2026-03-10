import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subcategories.g.dart';

@riverpod
Future<Category> subcategories(Ref ref, String categoryId) async {
  final filter = ref.watch(subcategoryFilterProvider(categoryId));
  final service = ref.read(subcategoriesServiceProvider);
  return service.list(variables: {
    'filter': filter,
    'id': categoryId,
  });
}
