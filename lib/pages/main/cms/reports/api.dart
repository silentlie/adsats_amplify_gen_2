import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/API/send_email.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/enum_label_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Report> deleteReport(Report report) async {
  try {
    final request = GraphQLRequest<String>(
      document: getReportDetailsGraphQL,
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
    debugPrint('ApiException: delete Report with ${report.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: delete Report with ${report.id} failed: $e');
    rethrow;
  }
}

Future<void> updateReportStaff(
  Report? oldReport,
  Report newReport,
  List<Staff> recipients,
) async {
  // Create a copy of recipients to avoid modifying the original list
  final newRecipients = List<Staff>.from(recipients);

  // Wait for all futures to complete
  await Future.wait([
    sendReportEmail(newReport, recipients),
    // Handle existing recipients
    ...oldReport?.recipients!.map(
          (e) {
            if (newRecipients.contains(e.staff)) {
              // Keep existing staff and remove from new recipients
              newRecipients.remove(e.staff);
              return update(
                ReportStaff(
                  id: e.id,
                  staff: e.staff,
                  report: e.report,
                ),
              );
            } else {
              // Remove staff that are no longer recipients
              return delete(e);
            }
          },
        ) ??
        [],
    // Add new recipients
    ...newRecipients.map(
      (staff) => create(
        ReportStaff(
          report: newReport,
          staff: staff,
        ),
      ),
    ),
  ]);
}

Future<void> sendReportEmail(Report report, Iterable<Staff> staff) async {
  if (staff.isEmpty) return;
  final subject =
      "${report.type!.label}: ${report.subject} [${report.status!.name}]";
  final htmlBody = buildReportEmailMain(report);
  final sender = "${report.auditor!.firstName} ${report.auditor!.lastName}";
  final recipients = staff.map((e) => e.email).toList();
  await sendEmail(
    subject: subject,
    sender: sender,
    htmlMain: htmlBody,
    recipients: recipients,
  );
}
