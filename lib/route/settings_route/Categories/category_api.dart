import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Subcategories/subcategory_api.dart'
    as subcategory;
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter/material.dart';

Future<void> create(Category category) async {
  try {
    final request = ModelMutations.create(category);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Add category result: ${data.name}');
  } on ApiException catch (e) {
    debugPrint('Add category failed: $e');
  }
}

Future<void> update(Category category) async {
  try {
    final request = ModelMutations.update(category);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Update category result: $data');
  } on ApiException catch (e) {
    debugPrint('Update category failed: $e');
  }
}

Future<void> delete(Category category) async {
  try {
    final request = ModelMutations.delete(category);
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    Iterable<Future<dynamic>> futures = category.subcategories?.map(
          (e) async {
            await subcategory.delete(e);
          },
        ).toList() ??
        [];
    await Future.wait(futures);
    // print('Delete category result: $data');
  } on ApiException catch (e) {
    debugPrint('Delete category failed: $e');
  }
}

