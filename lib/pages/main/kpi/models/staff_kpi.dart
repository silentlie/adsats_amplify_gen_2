import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_kpi.freezed.dart';

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
