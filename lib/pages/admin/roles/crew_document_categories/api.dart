import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/CrewDocumentCategory.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<CrewDocumentCategory> deleteFlightCrewRecordsCategory(
    CrewDocumentCategory category) async {
  try {
    final request = GraphQLRequest<String>(
      document: getFlightCrewRecordsCategoryDetails,
      variables: {"id": category.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    CrewDocumentCategory returnFlightCrewRecordsCategory =
        CrewDocumentCategory.fromJson(jsonMap["getCrewDocumentCategory"]);
    final List<Future> futures = [];
    returnFlightCrewRecordsCategory.crewDocuments?.forEach(
      (crewDocument) => futures.add(deleteFlightCrewRecord(crewDocument)),
    );
    futures.add(delete(category));
    await Future.wait(futures);
    return category;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: delete Flight Crew Records Category with ${category.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Flight Crew Records Category with ${category.id} failed: $e');
    rethrow;
  }
}
