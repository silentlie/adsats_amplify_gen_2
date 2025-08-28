import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [listReportStaff])
FutureOr<List<Report>> reportsInboxRepo(
  Ref ref,
  ReportFilterState filter,
) async {
  final reportIds = await ref.watch(listReportStaffProvider(
    ReportStaff.STAFF.eq(filter.user.id),
  ).future);
  final filterJson = filter.toJson();
  if (reportIds.isEmpty) {
    return [];
  }
  filterJson["or"] = reportIds
      .map((e) => {
            "id": {"eq": e.report!.id}
          })
      .toList();
  final request = GraphQLRequest<String>(
    document: listReportsGraphQL,
    variables: {"filter": filterJson},
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listReports"]["items"] as List)
      .map((report) => Report.fromJson(report))
      .toList();
}
