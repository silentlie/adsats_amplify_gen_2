import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<void> create(Subcategory subcategory) async {
  try {
    final request = ModelMutations.create(subcategory);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Add subcategory result: ${data.name}');
  } on ApiException catch (e) {
    debugPrint('Add subcategory failed: $e');
  }
}

Future<void> update(Subcategory subcategory) async {
  try {
    final request = ModelMutations.update(subcategory);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Update subcategory result: $data');
  } on ApiException catch (e) {
    debugPrint('Update subcategory failed: $e');
  }
}

Future<void> delete(Subcategory subcategory) async {
  try {
    final request = GraphQLRequest<String>(
      document: deleteSubcategoryOverride,
      variables: {"subcategoryId": subcategory.id},
    );
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Delete subcategory result: $data');
  } on ApiException catch (e) {
    debugPrint('Delete subcategory failed: $e');
  }
}
