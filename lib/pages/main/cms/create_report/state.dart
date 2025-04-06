import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/s3.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/view_cms/api.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/view_report/repo.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';
part 'state.freezed.dart';

@Riverpod(dependencies: [SelectedFiles, isQualityManager, userDetails])
class ReportNotifier extends _$ReportNotifier {
  ReportNotifier();
  Report? _initialReport;
  @override
  ReportState build() {
    return ReportState(
      formKey: GlobalKey<FormState>(),
      report: Report(
        subject: "",
        archived: false,
        details: "",
      ),
      editMode: false,
    );
  }

  void setReport(Report report, bool isInitialReport) {
    state.report = report;
    state.editMode = !isInitialReport;
    if (isInitialReport) _initialReport = report;
  }

  bool validate() {
    return state.formKey.currentState!.validate();
  }

  Future<void> submit(bool isSend) async {
    state.formKey.currentState!.save();
    final List<Future> futures = switch (isEditable()) {
      true => [
          update(state.report),
          // updateAircraftReport(
          //   _initialReport!,
          //   state.report,
          // ),
          ..._initialReport!.documents!
              .where((element) => !state.report.documents!.contains(element))
              .map((e) => deleteReportDocumentFile(e, _initialReport!))
        ],
      false => [
          create(state.report),
          // ...state.report.aircraft!.map((e) => create(e)),
        ]
    };
    final newFiles = ref.watch(selectedFilesProvider);
    futures
        .addAll(newFiles.map((e) => uploadReportDocumentFile(e, state.report)));
    if (isSend) {
      // final finalRecipients = await fetchJoinRecipients(
      //   roles: _roles,
      //   report: state.report,
      // );
      final finalRecipients =
          await ref.watch(staffByRoleNameProvider("Quality Manager").future);
      await updateReportStaff(
        _initialReport,
        state.report,
        finalRecipients,
      );
    }
    await Future.wait(futures);
  }

  void updateReport({
    String? subject,
    Staff? auditor,
    bool? archived,
    ReportStatus? status,
    TemporalDateTime? reportedAt,
    // List<Aircraft>? aircraft,
    // List<Role>? roles,
    List<Staff>? recipients,
    List<ReportDocument>? documents,
    TemporalDateTime? closeAt,
    Staff? closer,
  }) {
    // if (roles != null) {
    //   _roles = roles;
    //   return;
    // }
    state.report = state.report.copyWith(
      subject: subject,
      auditor: auditor,
      archived: archived,
      status: status,
      reportedAt: reportedAt,
      documents: documents,
      recipients: recipients
          ?.map((e) => ReportStaff(report: state.report, staff: e))
          .toList(),
      // aircraft: aircraft
      //     ?.map((e) => AircraftReport(aircraft: e, report: state.report))
      //     .toList(),
      closeAt: closeAt,
      closer: closer,
    );
  }

  //This does trigger rebuild
  void updateDetailsTriggerWatch(Map<String, dynamic> details) {
    final updatedDetails = {
      ...state.details,
      ...details,
    };

    final status = updatedDetails['is_discrepancies_found'] == true
        ? ReportStatus.Pending
        : ReportStatus.Open;
    state = state.copyWith(
      report: state.report.copyWith(
        details: jsonEncode(updatedDetails),
        status: status,
      ),
    );
  }

  //This does not trigger rebuild
  void updateDetails(Map<String, dynamic> details) {
    state.report = state.report.copyWith(
      details: jsonEncode({
        ...state.details,
        ...details,
      }),
    );
  }

  void updateStatus(ReportStatus status) {
    Map<String, dynamic>? details = Map.from(state.details);
    if (status == ReportStatus.Open) {
      details['is_discrepancies_found'] = false;
    } else if (status == ReportStatus.Open) {
      details['is_discrepancies_found'] = true;
    } else {
      details = null;
    }
    state = state.copyWith(
      report: state.report.copyWith(
        status: status,
        details: details != null ? jsonEncode(details) : null,
      ),
    );
  }

  void removeReportDocument(ReportDocument document) {
    state.report.documents!.remove(document);
    state = state.copyWith(
      report: state.report.copyWith(
        documents: [...state.report.documents!],
      ),
    );
  }

  void switchEditMode() {
    if (state.editMode) ref.invalidate(reportRepoProvider);
    state = state.copyWith(editMode: !state.editMode);
  }

  bool isEditable() {
    return _initialReport != null;
  }

  bool editPermit() {
    return ref.watch(isQualityManagerProvider) ||
        state.report.auditor?.id ==
            ref.watch(userDetailsProvider).valueOrNull!.id;
  }

  void resetFormKey() {
    state.formKey = GlobalKey<FormState>();
  }
}

@unfreezed
sealed class ReportState with _$ReportState {
  ReportState._();
  factory ReportState({
    required GlobalKey<FormState> formKey,
    required Report report,
    @Default(true) bool editMode,
  }) = _ReportState;

  Map<String, dynamic> get details {
    String detailsStr = report.details;
    return json.decode(detailsStr) as Map<String, dynamic>;
  }

  // List<Aircraft> get aircraft {
  //   return report.aircraft!.map((e) => e.aircraft!).toList();
  // }

  List<Staff> get recipients {
    return report.recipients!.map((e) => e.staff!).toList();
  }

  bool get isDraft {
    return (report.status ?? ReportStatus.Open) == ReportStatus.Draft;
  }
}

@riverpod
FutureOr<List<Staff>> staffByRoleName(Ref ref, String roleName) async {
  final request = GraphQLRequest<String>(
    document: listStaffByRole,
    variables: {"roleName": roleName},
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return Role.fromJson((jsonMap["listRoles"]["items"] as List).first)
      .staff!
      .map(
    (e) {
      return e.staff!;
    },
  ).toList();
}
