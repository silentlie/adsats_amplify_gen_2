import 'dart:convert';

import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/models/form.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/service.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form.g.dart';

@Riverpod(dependencies: [SelectedFiles, isComplianceManager, userDetails])
class ReportForm extends _$ReportForm {
  ReportForm();
  factory ReportForm.withReport(Report report, bool isNew) {
    final r = ReportForm();
    r._draftReport = report;
    r._initialReport = isNew ? null : report;
    r._seeded = true;
    return r;
  }

  bool _seeded = false;
  late Report _draftReport;
  late final Report? _initialReport;
  Map<String, dynamic> _draftDetails = {};
  List<ReportDocument> _documents = [];

  @override
  ReportFormState build() {
    if (!_seeded) {
      throw StateError(
        'ReportForm must be initialized with ReportForm.withReport()',
      );
    }
    final raw = _draftReport.details;
    _draftDetails = raw.isEmpty
        ? <String, dynamic>{}
        : (json.decode(raw) as Map).cast<String, dynamic>();
    _documents = _draftReport.documents ?? <ReportDocument>[];
    return ReportFormState(
      report: _draftReport,
      editMode: isNew(),
    );
  }

  bool isNew() {
    return _initialReport == null;
  }

  // check if user is compliance manager or author of the report
  bool editPermit() {
    return ref.watch(isComplianceManagerProvider) ||
        ref.watch(userDetailsProvider).value?.id == _draftReport.auditor?.id;
  }

  void switchEditMode() {
    state = state.copyWith(editMode: !state.editMode);
  }

  void switchStatus(ReportStatus status) {
    state = state.copyWith(
      report: state.report.copyWith(
        status: status,
      ),
    );
  }

  void updateReport({
    String? subject,
    Staff? auditor,
    bool? archived,
    bool? discrepanciesFound,
    TemporalDateTime? reportDate,
    TemporalDateTime? closeDate,
    Staff? closer,
  }) {
    _draftReport = _draftReport.copyWith(
      subject: subject,
      auditor: auditor,
      archived: archived,
      discrepanciesFound: discrepanciesFound,
      closeAt: closeDate,
      closer: closer,
      reportedAt: reportDate,
    );
  }

  void updateDetails(Map<String, dynamic> details) {
    _draftDetails = {..._draftDetails, ...details}
      ..removeWhere((k, v) => v == null);
  }

  void removeDocument(ReportDocument document) {
    _documents.remove(document);
    commit();
  }

  void commit() {
    _draftReport = _draftReport.copyWith(
      details: json.encode(_draftDetails),
      documents: _documents,
    );
    state = state.copyWith(report: _draftReport);
  }

  Future<void> submit(
    bool send,
    void Function(String fileName, double progress) onProgressUpdate,
  ) async {
    commit();
    final service = ref.read(reportServiceProvider);
    await service.saveAndOptionallySend(
      report: _draftReport,
      initial: _initialReport,
      newDocuments: ref.read(selectedFilesProvider),
      keepDocuments: _documents,
      send: send,
      onProgress: onProgressUpdate,
    );
  }
}
