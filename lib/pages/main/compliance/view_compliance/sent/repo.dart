import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/Report.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<List<Report>> reportsSentRepo(
  Ref ref,
  ReportFilterState filter,
) async {
  final filterJson = filter.toJson();
  filterJson["auditorId"] = {"eq": filter.user.id};
  final request = GraphQLRequest<String>(
    document: listReports,
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
