import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/models/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/models/staff_kpi.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<List<StaffKPI>> staffKPIRepo(
  Ref ref,
  StaffKPIFilterState filter,
) async {
  final request = GraphQLRequest<String>(
    document: listStaffKPIGraphQL,
    variables: filter.toJson(),
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listStaff"]["items"] as List)
      .map((staff) => StaffKPI(staff: Staff.fromJson(staff)))
      .toList();
}
