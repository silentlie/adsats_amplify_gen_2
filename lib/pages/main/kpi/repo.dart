import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';
part 'repo.freezed.dart';

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

@freezed
sealed class StaffKPI with _$StaffKPI {
  StaffKPI._();
  factory StaffKPI({
    required final Staff staff,
  }) = _StaffKPI;

  String get name => "${staff.firstName} ${staff.lastName}";
  bool get archived => staff.archived;
  int get noticeToCrews => staff.notices!.where(
        (element) {
          return element.type == NoticeType.Notice_to_Crew;
        },
      ).length;
  int get safetyNotices => staff.notices!.where(
        (element) {
          return element.type == NoticeType.Safety_notice;
        },
      ).length;
  int get hazardReports => staff.notices!.where(
        (element) {
          return element.type == NoticeType.Hazard_report;
        },
      ).length;
  int get internalAuditReports => staff.reports!.where(
        (element) {
          return element.type == ReportType.Internal_audit_report;
        },
      ).length;
  int get externalAuditReports => staff.reports!.where(
        (element) {
          return element.type == ReportType.External_audit_report;
        },
      ).length;
}
