import 'dart:convert';

import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/s3_extention.dart';
import 'package:adsats_amplify_gen_2/helper/providers/storage_api.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/models/notice_form.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/sent/repo.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_form.g.dart';

@Riverpod(dependencies: [SelectedFiles, isSafetyOfficer, userDetails])
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
    List<Aircraft>? aircraft,
    List<Role>? roles,
    List<Staff>? recipients,
  ) {
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
      status: status,
      noticedAt: noticedAt,
      deadlineAt: deadlineAt,
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
    await _syncNotice(onProgressUpdate);
    await _syncRecipients(send);
    ref.invalidate(noticesSentRepoProvider);
    ref.invalidate(noticesInboxRepoProvider);
  }

  Future<void> _syncNotice(
    void Function(String fileName, double progress) onProgressUpdate,
  ) async {
    final database = ref.read(databaseAPIProvider);
    final storage = ref.read(storageAPIProvider);

    final List<Future<Model>> futures = [];
    final List<Future> storageFutures = [];
    if (_initialNotice == null) {
      // Create new notice
      futures.add(database.create(state.notice));
      // Create new relations with aircraft
      futures.addAll(
        _aircraft.map(
          (e) => database.create(AircraftNotice(
            aircraft: e,
            notice: state.notice,
          )),
        ),
      );
    } else {
      // Update existing notice
      futures.add(database.update(state.notice));
      // Keep track of old aircraft notices
      final oldMap = {
        for (var old in _initialNotice.aircraft!) old.aircraft!.id: old
      };
      // Create new relation if not exists
      for (final newAircraft in _aircraft) {
        final old = oldMap.remove(newAircraft.id);
        if (old == null) {
          futures.add(database.create(AircraftNotice(
            aircraft: newAircraft,
            notice: state.notice,
          )));
        }
      }
      // Delete old relations not in new list
      for (final old in oldMap.values) {
        futures.add(database.delete(old));
      }
      // Delete documents not in new list
      _initialNotice.documents?.where((doc) {
        return !state.notice.documents!.contains(doc);
      }).forEach((doc) {
        futures.add(database.delete(doc));
        storageFutures.add(storage.deleteFile(doc.s3Path(_initialNotice)));
      });
    }
    // Upload new documents and create records in the database
    for (final doc in ref.read(selectedFilesProvider)) {
      final noticeDocument = NoticeDocument(
        name: doc.name,
        notices: state.notice,
      );
      futures.add(database.create(noticeDocument));
      storage.uploadFile(
        file: doc,
        s3Path: noticeDocument.s3Path(state.notice),
        onProgress: (progress) {
          onProgressUpdate(doc.name, progress.fractionCompleted);
        },
      );
    }
    await Future.wait(storageFutures);
    await Future.wait(futures);
  }

  Future<Iterable<Staff>> _finaliseRecipients() async {
    if (_aircraft.isEmpty || _roles.isEmpty) return const [];
    final database = ref.read(databaseAPIProvider);
    final recipients = <Staff>[..._recipients];
    await database.query(
      documents: listJoinRecipientsGraphQL,
      variables: {
        "aircraftFilter": {
          "or": _aircraft
              .map((aircraft) => {
                    "aircraftId": {"eq": aircraft.id}
                  })
              .toList()
        },
        "rolesFilter": {
          "or": _roles
              .map((role) => {
                    "roleId": {"eq": role.id}
                  })
              .toList()
        },
      },
    ).then((value) {
      for (var element in (value["listStaff"]["items"] as List)) {
        final staff = Staff.fromJson(element);
        if (staff.aircraft!.isNotEmpty && staff.roles!.isNotEmpty) {
          recipients.add(staff);
        }
      }
    });
    return recipients.fold<Map<String, Staff>>({}, (map, staff) {
      map.putIfAbsent(staff.id, () => staff);
      return map;
    }).values;
  }

  Future<void> _syncRecipients(bool send) async {
    final recipients = await _finaliseRecipients();
    if (recipients.isEmpty) return;
    final database = ref.read(databaseAPIProvider);
    final futures = <Future>[];
    // Keep track old relations
    final oldMap = {
      for (final old in _initialNotice?.recipients ?? <NoticeStaff>[])
        old.staff!.id: old
    };
    for (final newStaff in recipients) {
      // Pop from oldMap
      final old = oldMap.remove(newStaff.id);
      // New relation
      if (old == null) {
        futures.add(database.create(NoticeStaff(
          notice: state.notice,
          staff: newStaff,
        )));
      } else if (send) {
        // Reset read status if send for old relation still exist
        futures.add(database.update(NoticeStaff(
          id: old.id,
          notice: state.notice,
          staff: newStaff,
        )));
      }
    }
    // Delete relations that not exist anymore
    for (final old in oldMap.values) {
      futures.add(database.delete(old));
    }
    await Future.wait(futures);
  }
}
