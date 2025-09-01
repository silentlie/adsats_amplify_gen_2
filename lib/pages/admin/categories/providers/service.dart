import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
CategoriesRepository categoriesService(
  Ref ref,
) {
  return CategoriesRepository(
    db: ref.read(databaseAPIProvider),
    subcategoriesRepository: ref.read(subcategoriesServiceProvider),
  );
}
