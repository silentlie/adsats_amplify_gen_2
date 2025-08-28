import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/database_repository.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/models/notice_form.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_form.g.dart';

@Riverpod(dependencies: [SelectedFiles, isSafetyOfficer, userDetails])
class NoticeForm extends _$NoticeForm {
  NoticeForm();
  factory NoticeForm.withNotice(Notice notice, bool isNew) {
    final n = NoticeForm();
    n._draftNotice = notice;
    n._initialNotice = notice;
    return n;
  }

  bool seeded = false;
  late Notice _draftNotice;
  late final Notice? _initialNotice;
  Map<String, dynamic> _draftDetails = {};
  List<Aircraft> _aircraft = [];
  List<Role> _roles = [];
  List<Staff> _recipients = [];
  List<NoticeDocument> _documents = [];

  @override
  NoticeFormState build() {
    assert(
      seeded,
      "NoticeForm must be initialized with NoticeForm.withNotice()",
    );
    _draftDetails = json.decode(_draftNotice.details) as Map<String, dynamic>;
    _aircraft = _draftNotice.aircraft?.map((e) => e.aircraft!).toList() ?? [];
    _recipients = _draftNotice.recipients?.map((e) => e.staff!).toList() ?? [];
    _documents = _draftNotice.documents ?? [];
    return NoticeFormState(
      notice: _draftNotice,
      editMode: true,
    );
  }

  bool isNew() {
    return _initialNotice == null;
  }

  // check if user is safety officer or author of the notice
  bool editPermit() {
    return ref.watch(isSafetyOfficerProvider) ||
        state.notice.author?.id == ref.watch(userDetailsProvider).value?.id;
  }

  // switch edit mode trigger rebuild
  void switchEditMode() {
    state = state.copyWith(editMode: !state.editMode);
  }

  // change status trigger rebuild
  void switchStatus(NoticeStatus status) {
    state = state.copyWith(
        notice: state.notice.copyWith(
      status: status,
    ));
  }

  void updateNotice(
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
  ) {
    if (roles != null) {
      _roles = roles;
    }
    if (recipients != null) {
      _recipients = recipients;
    }
    if (documents != null) {
      _documents = documents;
    }
    if (aircraft != null) {
      _aircraft = aircraft;
    }
    _draftNotice = _draftNotice.copyWith(
      subject: subject,
      author: author,
      archived: archived,
      status: status,
      noticedAt: noticedAt,
      deadlineAt: deadlineAt,
    );
  }

  void updateStatus(NoticeStatus status) {
    state = state.copyWith(
      notice: state.notice.copyWith(status: status),
    );
  }

  void updateDetails(Map<String, dynamic> details) {
    _draftDetails = {
      ..._draftDetails,
      ...details,
    };
  }

  void removeNoticeDocument(NoticeDocument document) {
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

  Future<void> submit(bool send) async {
    commit();
    final repo = ref.read(databaseRepositoryProvider);

    final List<Future<Model>> futures = [];
    if (_initialNotice == null) {
      // Create new notice
      futures.add(repo.create(state.notice));
      // Create new relations with aircraft
      futures.addAll(
        _aircraft.map(
          (e) => repo.create(AircraftNotice(
            aircraft: e,
            notice: state.notice,
          )),
        ),
      );
    } else {
      // Update existing notice
      futures.add(repo.update(state.notice));
      // Keep track of old aircraft notices
      final oldMap = {
        for (var old in _initialNotice.aircraft!) old.aircraft!.id: old
      };
      // Create new relation if not exists
      for (final newAircraft in _aircraft) {
        final old = oldMap.remove(newAircraft.id);
        if (old == null) {
          futures.add(repo.create(AircraftNotice(
            aircraft: newAircraft,
            notice: state.notice,
          )));
        }
      }
      // Delete old relations not in new list
      for (final old in oldMap.values) {
        futures.add(repo.delete(old));
      }
      // Delete documents not in new list
      _initialNotice.documents?.where((doc) {
        return !state.notice.documents!.contains(doc);
      }).forEach((doc) {
        futures.add(repo.delete(doc));
      });
    }
    for (final doc in ref.watch(selectedFilesProvider)) {
      final noticeDocument = NoticeDocument(name: doc.name, notices: state.notice);
      futures.add(repo.create(noticeDocument));
      // TODO: Upload document to S3
    }
    await Future.wait(futures);
  }
}
