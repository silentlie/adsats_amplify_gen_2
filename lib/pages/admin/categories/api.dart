import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/api.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter/material.dart';

Future<Category> deleteCategory(Category category) async {
  try {
    //TODO fetch before delete
    final List<Future> futures = [];
    category.subcategories?.forEach(
      (subcategory) => futures.add(deleteSubcategory(subcategory)),
    );
    futures.add(delete(category));
    await Future.wait(futures);
    return category;
  } on ApiException catch (e) {
    debugPrint('ApiException: delete Category with ${category.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Category with ${category.id} failed: $e');
    rethrow;
  }
}
