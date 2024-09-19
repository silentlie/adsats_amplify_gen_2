import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Subcategory> deleteSubcategory(Subcategory subcategory) async {
  try {
    final request = GraphQLRequest<String>(
      document: getSubcategoryDetails,
      variables: {"id": subcategory.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    Subcategory returnSubcategory =
        Subcategory.fromJson(jsonMap["getSubcategory"]);
    final List<Future> futures = [];
    returnSubcategory.staff?.forEach(
      (staffSubcategory) => futures.add(delete(staffSubcategory)),
    );
    futures.add(delete(subcategory));
    return subcategory;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: delete Subcategory with ${subcategory.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Subcategory with ${subcategory.id} failed: $e');
    rethrow;
  }
}
