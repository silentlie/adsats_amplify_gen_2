import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form.freezed.dart';

@freezed
sealed class ReportFormState with _$ReportFormState {
  const ReportFormState._();
  const factory ReportFormState({
    required Report report,
    required bool editMode,
  }) = _ReportFormState;

  Map<String, dynamic> get details {
    final raw = report.details;
    if (raw.isEmpty) return const {};
    return Map<String, dynamic>.unmodifiable(json.decode(raw));
  }

  List<Staff> get recipients => (report.recipients ?? const [])
      .map((e) => e.staff!)
      .toList(growable: false);

  List<ReportDocument> get documents => report.documents ?? const [];

  bool get isDraft =>
      (report.status ?? ReportStatus.Open) == ReportStatus.Draft;
}
