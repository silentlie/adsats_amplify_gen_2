import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Subcategories/subcategory_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter/material.dart';

Future<Category> deleteCetegory(Category category) async {
  try {
    final List<Future> futures = [];
    category.subcategories?.forEach(
      (subcategory) => futures.add(deleteSubcategory(subcategory)),
    );
    futures.add(delete(category));
    return category;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Category with ${category.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Category with ${category.id} failed: $e');
    rethrow;
  }
}
