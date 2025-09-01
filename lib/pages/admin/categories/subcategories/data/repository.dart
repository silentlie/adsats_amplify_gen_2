import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;

class SubcategoriesRepository {
  final AmplifyAppSyncAPI _db;
  final DocumentsRepository _documentsRepository;

  SubcategoriesRepository({
    required AmplifyAppSyncAPI db,
    required DocumentsRepository documentsRepository,
  })  : _db = db,
        _documentsRepository = documentsRepository;

  Future<Category> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listSubcategoriesGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return Category.fromJson(res["getCategory"]);
  }

  Future<Subcategory> create(Subcategory subcategory) async {
    return _db.create(subcategory);
  }

  Future<Subcategory> archive(Subcategory subcategory) async {
    return _db.update(subcategory.copyWith(archived: !subcategory.archived));
  }

  Future<Subcategory> update(Subcategory subcategory) async {
    return _db.update(subcategory);
  }

  Future<Subcategory> delete(Subcategory subcategory) async {
    final futures = <Future>[];
    final res = await _db.query(
        document: getSubcategoryDetailsGraphQL,
        variables: {"id": subcategory.id});
    subcategory = Subcategory.fromJson(res["getSubcategory"]);
    subcategory.staff?.forEach(
      (staffSubcategory) => futures.add(_db.delete(staffSubcategory)),
    );
    subcategory.documents?.forEach(
      (document) {
        futures.add(_documentsRepository.delete(document));
      },
    );
    await Future.wait(futures);
    return await _db.delete(subcategory);
  }

  Future<void> upsertStaffSubcategory(
    List<StaffSubcategory> olds,
    List<StaffSubcategory> news,
  ) async {
    if (olds.isEmpty && news.isEmpty) {
      return;
    }
    if (olds.isEmpty) {
      await Future.wait(
        news.map((newRecord) => _db.create(newRecord)),
      );
      return;
    } else if (news.isEmpty) {
      await Future.wait(
        olds.map((oldRecord) => _db.delete(oldRecord)),
      );
      return;
    }
    final List<Future> futures = [];
    final Map<ModelIdentifier, StaffSubcategory> newMap = {
      for (var newRecord in news) newRecord.modelIdentifier: newRecord
    };
    for (var oldRecord in olds) {
      final newRecord = newMap.remove(oldRecord.modelIdentifier);
      if (newRecord == null) {
        futures.add(_db.delete(oldRecord));
      } else if (newRecord.accessLevel != oldRecord.accessLevel) {
        futures.add(_db.update(newRecord));
      }
    }
    for (var newRecord in newMap.values) {
      futures.add(_db.create(newRecord));
    }
    await Future.wait(futures);
  }
}
