import 'dart:convert';

import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/models/notice_form.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notices.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_form.g.dart';

@Riverpod(
    dependencies: [SelectedFiles, isSafetyOfficer, userDetails, noticeService])
class NoticeForm extends _$NoticeForm {
  NoticeForm();
  factory NoticeForm.withNotice(Notice notice, bool isNew) {
    final n = NoticeForm();
    n._draftNotice = notice;
    n._initialNotice = isNew ? null : notice;
    n._seeded = true;
    return n;
  }

  bool _seeded = false;
  late Notice _draftNotice;
  late final Notice? _initialNotice;
  Map<String, dynamic> _draftDetails = {};
  List<Aircraft> _aircraft = [];
  List<Role> _roles = [];
  List<Staff> _recipients = [];
  List<NoticeDocument> _documents = [];

  @override
  NoticeFormState build() {
    if (!_seeded) {
      throw StateError(
        'NoticeForm must be initialized with NoticeForm.withNotice()',
      );
    }
    final raw = _draftNotice.details;
    _draftDetails = raw.isEmpty
        ? <String, dynamic>{}
        : (json.decode(raw) as Map).cast<String, dynamic>();
    _aircraft = _draftNotice.aircraft?.map((e) => e.aircraft!).toList() ?? [];
    _recipients = _draftNotice.recipients?.map((e) => e.staff!).toList() ?? [];
    _documents = _draftNotice.documents ?? [];
    return NoticeFormState(
      notice: _draftNotice,
      editMode: isNew(),
    );
  }

  bool isNew() {
    return _initialNotice == null;
  }

  // check if user is safety officer or author of the notice
  bool editPermit() {
    return ref.watch(isSafetyOfficerProvider) ||
        state.notice.author?.id ==
            ref.watch(userDetailsProvider.select(
              (value) => value.value?.id,
            ));
  }

  // switch edit mode trigger rebuild
  void switchEditMode() {
    state = state.copyWith(editMode: !state.editMode);
  }

  // change status trigger rebuild
  void switchStatus(NoticeStatus status) {
    _draftNotice = _draftNotice.copyWith(
      status: status,
    );
    commit();
  }

  void updateNotice({
    String? subject,
    Staff? author,
    bool? archived,
    TemporalDateTime? noticedDate,
    TemporalDateTime? deadlineDate,
    List<Aircraft>? aircraft,
    List<Role>? roles,
    List<Staff>? recipients,
  }) {
    if (roles != null) {
      _roles = roles;
    }
    if (recipients != null) {
      _recipients = recipients;
    }
    if (aircraft != null) {
      _aircraft = aircraft;
    }
    _draftNotice = _draftNotice.copyWith(
      subject: subject,
      author: author,
      archived: archived,
      noticedAt: noticedDate,
      deadlineAt: deadlineDate,
    );
  }

  void updateDetails(Map<String, dynamic> details) {
    _draftDetails = {..._draftDetails, ...details}
      ..removeWhere((k, v) => v == null);
  }

  void removeDocument(NoticeDocument document) {
    _documents.remove(document);
    commit();
  }

  void commit() {
    _draftNotice = _draftNotice.copyWith(
      details: jsonEncode(_draftDetails),
      documents: _documents,
    );
    state = state.copyWith(
      notice: _draftNotice,
    );
  }

  // May need to create a notice repository
  Future<void> submit(
    bool send,
    void Function(String fileName, double progress) onProgressUpdate,
  ) async {
    commit();
    final service = ref.read(noticeServiceProvider);
    await service.saveAndOptionallySend(
      draft: state.notice,
      initial: _initialNotice,
      aircraft: _aircraft,
      roles: _roles,
      manualRecipients: _recipients,
      newDocuments: ref.read(selectedFilesProvider),
      keepDocuments: _documents,
      send: send,
      onProgress: onProgressUpdate,
    );
    ref.invalidate(noticesProvider);
  }
}
