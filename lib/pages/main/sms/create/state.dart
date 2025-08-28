import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/api.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/s3.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/sent/repo.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';
part 'state.freezed.dart';

@Riverpod(dependencies: [SelectedFiles, isSafetyOfficer, userDetails])
class NoticeNotifier extends _$NoticeNotifier {
  NoticeNotifier();
  factory NoticeNotifier.withNotice(Notice notice, bool isNew) {
    final n = NoticeNotifier();
    n._notice = notice;
    n._isNew = isNew;
    return n;
  }
  late Notice _notice;
  late final bool _isNew;
  List<Role> _roles = [];
  @override
  NoticeState build() {
    return NoticeState(
      formKey: GlobalKey<FormState>(),
      notice: _notice,
      editMode: _isNew,
    );
  }

  Future<void> submit(bool isSend) async {
    state.formKey.currentState!.save();
    final List<Future> futures = switch (isEditable()) {
      true => [
          update(state.notice),
          updateAircraftNotice(
            _notice,
            state.notice,
          ),
          ..._notice.documents!
              .where((element) => !state.notice.documents!.contains(element))
              .map((e) => deleteNoticeDocumentFile(e, _notice))
        ],
      false => [
          create(state.notice),
          ...state.notice.aircraft!.map((e) => create(e)),
        ]
    };
    final newFiles = ref.watch(selectedFilesProvider);
    futures
        .addAll(newFiles.map((e) => uploadNoticeDocumentFile(e, state.notice)));
    await Future.wait(futures);
    if (isSend) {
      final finalRecipients = await fetchJoinRecipients(
        roles: _roles,
        notice: state.notice,
      );
      await updateNoticeStaff(
        _notice,
        state.notice,
        finalRecipients,
      );
    }
    ref.invalidate(noticesSentRepoProvider);
    ref.invalidate(noticesInboxRepoProvider);
  }

  void updateNotice({
    String? subject,
    Staff? author,
    bool? archived,
    NoticeStatus? status,
    TemporalDateTime? noticedAt,
    TemporalDateTime? deadlineAt,
    Map<String, dynamic>? details,
    List<Aircraft>? aircraft,
    List<Role>? roles,
    List<Staff>? recipients,
    List<NoticeDocument>? documents,
  }) {
    if (roles != null) {
      _roles = roles;
      return;
    }
    state.notice = state.notice.copyWith(
      subject: subject,
      author: author,
      archived: archived,
      status: status,
      noticedAt: noticedAt,
      deadlineAt: deadlineAt,
      details: details == null ? null : jsonEncode(details),
      documents: documents,
      recipients: recipients
          ?.map((e) => NoticeStaff(notice: state.notice, staff: e))
          .toList(),
      aircraft: aircraft
          ?.map((e) => AircraftNotice(aircraft: e, notice: state.notice))
          .toList(),
    );
  }

  //This does trigger rebuild
  void updateDetailsTriggerWatch(Map<String, dynamic> details) {
    final updatedDetails = {
      ...state.details,
      ...details,
    };
    state = state.copyWith(
      notice: state.notice.copyWith(
        details: jsonEncode(updatedDetails),
      ),
    );
  }

  //This does not trigger rebuild
  void updateDetails(Map<String, dynamic> details) {
    final updatedDetails = {
      ...state.details,
      ...details,
    };
    // state = state.copyWith(
    //   notice: state.notice.copyWith(
    //     details: jsonEncode(updatedDetails),
    //   ),
    // );
    state.notice = state.notice.copyWith(
      details: jsonEncode(updatedDetails),
    );
  }

  void updateStatus(NoticeStatus status) {
    state = state.copyWith(
      notice: state.notice.copyWith(status: status),
    );
  }

  void removeNoticeDocument(NoticeDocument document) {
    state.notice.documents!.remove(document);
    state = state.copyWith(
      notice: state.notice.copyWith(
        documents: [...state.notice.documents!],
      ),
    );
  }

  void switchEditMode() {
    // if (state.editMode) ref.invalidate(noticeRepoProvider);
    state = state.copyWith(editMode: !state.editMode);
  }

  bool isEditable() {
    return !_isNew;
  }

  bool editPermit() {
    return ref.watch(isSafetyOfficerProvider) ||
        state.notice.author?.id == ref.watch(userDetailsProvider).value!.id;
  }

  void resetFormKey() {
    state.formKey = GlobalKey<FormState>();
  }
}

@unfreezed
sealed class NoticeState with _$NoticeState {
  NoticeState._();
  factory NoticeState({
    required GlobalKey<FormState> formKey,
    required Notice notice,
    @Default(true) bool editMode,
  }) = _NoticeState;

  Map<String, dynamic> get details {
    String detailsStr = notice.details;
    return Map<String, dynamic>.unmodifiable(json.decode(detailsStr));
  }

  List<Aircraft> get aircraft {
    return notice.aircraft!.map((e) => e.aircraft!).toList(growable: false);
  }

  List<Staff> get recipients {
    return notice.recipients!.map((e) => e.staff!).toList(growable: false);
  }

  bool get isDraft {
    return (notice.status ?? NoticeStatus.Open) == NoticeStatus.Draft;
  }
}
