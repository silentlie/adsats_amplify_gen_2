import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_form.freezed.dart';

@freezed
sealed class NoticeFormState with _$NoticeFormState {
  const NoticeFormState._();
  const factory NoticeFormState({
    required Notice notice,
    required bool editMode,
  }) = _NoticeState;

  Map<String, dynamic> get details {
    final raw = notice.details;
    if (raw.isEmpty) return const {};
    return Map<String, dynamic>.unmodifiable(json.decode(raw));
  }

  List<Aircraft> get aircraft => (notice.aircraft ?? const [])
      .map((e) => e.aircraft!)
      .toList(growable: false);

  List<Staff> get recipients => (notice.recipients ?? const [])
      .map((e) => e.staff!)
      .toList(growable: false);

  bool get isDraft =>
      (notice.status ?? NoticeStatus.Open) == NoticeStatus.Draft;
}