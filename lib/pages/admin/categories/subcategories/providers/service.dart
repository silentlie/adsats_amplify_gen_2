import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(keepAlive: true)
SubcategoriesRepository subcategoriesService(
  Ref ref,
) {
  return SubcategoriesRepository(
    db: ref.read(databaseAPIProvider),
    documentsRepository: ref.read(documentsServiceProvider),
  );
}
