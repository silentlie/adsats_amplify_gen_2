import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/data/repository.dart';

class CategoriesRepository {
  final AmplifyAppSyncAPI _db;
  final SubcategoriesRepository _subcategoriesRepository;

  CategoriesRepository({
    required AmplifyAppSyncAPI db,
    required SubcategoriesRepository subcategoriesRepository,
  })  : _db = db,
        _subcategoriesRepository = subcategoriesRepository;

  Future<List<Category>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listCategoriesGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res['listCategories']['items'] as List)
        .map((e) => Category.fromJson(e))
        .toList();
  }

  Future<Category> create(Category category) async {
    return _db.create(category);
  }

  Future<Category> update(Category category) async {
    return _db.update(category);
  }

  Future<Category> archive(Category category) async {
    return _db.update(category.copyWith(archived: !category.archived));
  }

  Future<Category> delete(Category category) async {
    final List<Future> futures = [];
    category.subcategories?.forEach(
      (subcategory) =>
          futures.add(_subcategoriesRepository.delete(subcategory)),
    );
    futures.add(_db.delete(category));
    await Future.wait(futures);
    return category;
  }
}
