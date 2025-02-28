import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/CrewDocumentCategory.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<CrewDocumentCategory> deleteCrewDocumentCategory(
    CrewDocumentCategory category) async {
  try {
    final request = GraphQLRequest<String>(
      document: getCrewDocumentCategoryDetails,
      variables: {"id": category.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    CrewDocumentCategory returnCrewDocumentCategory =
        CrewDocumentCategory.fromJson(jsonMap["getCrewDocumentCategory"]);
    final List<Future> futures = [];
    returnCrewDocumentCategory.crewDocuments?.forEach(
      //TODO delete crew document
      (crewDocument) => futures.add(delete(crewDocument)),
    );
    futures.add(delete(category));
    await Future.wait(futures);
    return category;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: delete Crew Document Category with ${category.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Crew Document Category with ${category.id} failed: $e');
    rethrow;
  }
}
