import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Report> deleteReport(Report report) async {
  try {
    final request = GraphQLRequest<String>(
      document: getReportDetails,
      variables: {"id": report.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    Report returnReport = Report.fromJson(jsonMap["getReport"]);
    final List<Future> futures = [];
    returnReport.recipients?.forEach(
      (reportStaff) => futures.add(delete(reportStaff)),
    );
    futures.add(delete(report));
    await Future.wait(futures);
    return report;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Report with ${report.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: delete Report with ${report.id} failed: $e');
    rethrow;
  }
}

//TODO send email
