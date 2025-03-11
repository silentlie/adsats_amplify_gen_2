import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/api.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/s3.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_notice/repo.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';
part 'state.freezed.dart';

@Riverpod(dependencies: [SelectedFiles, isSafetyOfficer, userDetails])
class NoticeNotifier extends _$NoticeNotifier {
  NoticeNotifier();
  Notice? _initialNotice;
  List<Role> _roles = [];
  @override
  NoticeState build() {
    return NoticeState(
      formKey: GlobalKey<FormState>(),
      notice: Notice(
        subject: "",
        archived: false,
        details: "",
      ),
      editMode: false,
    );
  }

  void setNotice(Notice notice, bool isInitialNotice) {
    state.notice = notice;
    state.editMode = !isInitialNotice;
    if (isInitialNotice) _initialNotice = notice;
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

  Future<void> submit(bool isSend) async {
    state.formKey.currentState!.save();
    final List<Future> futures = switch (isEditable()) {
      true => [
          update(state.notice),
          updateAircraftNotice(
            _initialNotice!,
            state.notice,
          ),
          ..._initialNotice!.documents!
              .where((element) => !state.notice.documents!.contains(element))
              .map((e) => deleteFile(e, _initialNotice!))
        ],
      false => [
          create(state.notice),
          ...state.notice.aircraft!.map((e) => create(e)),
        ]
    };
    final newFiles = ref.watch(selectedFilesProvider);
    futures.addAll(newFiles.map((e) => uploadFile(e, state.notice)));
    if (isSend) {
      final finalRecipients = await fetchJoinRecipients(
        roles: _roles,
        notice: state.notice,
      );
      futures.addAll([
        ...finalRecipients.map(
          (e) {
            return create(NoticeStaff(staff: e, notice: state.notice));
          },
        ),
        sendEmail(state.notice, finalRecipients),
      ]);
    }
    await Future.wait(futures);
  }

  void updateStatus(NoticeStatus status) {
    state = state.copyWith(notice: state.notice.copyWith(status: status));
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
    if (state.editMode) ref.invalidate(noticeRepoProvider);
    state = state.copyWith(editMode: !state.editMode);
  }

  bool isEditable() {
    return _initialNotice != null;
  }

  bool editPermit() {
    return ref.watch(isSafetyOfficerProvider) ||
        state.notice.author?.id ==
            ref.watch(userDetailsProvider).valueOrNull!.id;
  }
}

@unfreezed
class NoticeState with _$NoticeState {
  NoticeState._();
  factory NoticeState({
    required GlobalKey<FormState> formKey,
    required Notice notice,
    @Default(true) bool editMode,
  }) = _NoticeState;

  Map<String, dynamic> get details {
    String detailsStr = notice.details;
    return json.decode(detailsStr) as Map<String, dynamic>;
  }

  List<Aircraft> get aircraft {
    return notice.aircraft!.map((e) => e.aircraft!).toList();
  }

  List<Staff> get recipients {
    return notice.recipients!.map((e) => e.staff!).toList();
  }

  bool get isDraft {
    return (notice.status ?? NoticeStatus.Draft) == NoticeStatus.Draft;
  }
}
