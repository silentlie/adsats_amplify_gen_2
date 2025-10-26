import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_email_repository.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/email_content_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeRepository {
  final AmplifyAppSyncAPI _db;
  final AmplifyS3API _storage;
  final AmplifyEmailRepository _email;

  NoticeRepository({
    required AmplifyAppSyncAPI db,
    required AmplifyS3API storage,
    required AmplifyEmailRepository email,
  })  : _email = email,
        _storage = storage,
        _db = db;

  // ---------- Public API ----------

  Future<Notice> getById(String id) async {
    final res = await _db.query(
      document: getNoticeDetailsGraphQL,
      variables: {"id": id},
    );
    return Notice.fromJson(res["getNotice"]);
  }

  Future<List<String>> listIdsForInbox(String staffId) async {
    final ids = await _db.listAll(
      modelType: NoticeStaff.classType,
      where: NoticeStaff.STAFF.eq(staffId),
    );
    return ids.map((e) => e.notice!.id).toList();
  }

  Future<List<Notice>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listNoticesGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res["listNotices"]["items"] as List)
        .map((e) => Notice.fromJson(e))
        .toList();
  }

  Future<Notice> archive(Notice notice) async {
    return _db.update(notice.copyWith(archived: !notice.archived));
  }

  Future<NoticeStaff> read(NoticeStaff noticeStaff) async {
    return _db.update(noticeStaff.copyWith(readAt: TemporalDateTime.now()));
  }

  Future<Notice> delete(Notice notice) async {
    // Load latest relations before deleting
    final res = await _db.query(
      document: getNoticeDetailsGraphQL,
      variables: {"id": notice.id},
    );
    notice = Notice.fromJson(res["getNotice"]);

    final futures = <Future>[];
    // Delete join rows
    futures.addAll((notice.recipients ?? const <NoticeStaff>[])
        .map((ns) => _db.delete(ns)));
    futures.addAll((notice.aircraft ?? const <AircraftNotice>[])
        .map((an) => _db.delete(an)));

    // Delete documents (storage first, then DB)
    futures.add(_removeDocuments(
      initial: notice,
      keep: const [],
    ));

    // Delete the notice itself
    futures.add(_db.delete(notice));

    await Future.wait(futures);
    return notice;
  }

  Future<void> saveAndOptionallySend({
    required Notice draft,
    required Notice? initial,
    required List<Aircraft> aircraft,
    required List<Role> roles,
    required List<Staff> manualRecipients,
    required List<PlatformFile> newDocuments,
    required List<NoticeDocument> keepDocuments,
    required bool send,
    required void Function(String name, double p) onProgress,
  }) async {
    // 1) Upsert notice
    final saved =
        initial == null ? await _db.create(draft) : await _db.update(draft);

    // 2) Aircraft links
    await _upsertAircraftNotices(
        notice: saved, initial: initial, newAircraft: aircraft);

    // 3) Remove deleted docs (storage first, then DB)
    if (initial != null) {
      await _removeDocuments(
        initial: initial,
        keep: keepDocuments,
      );
    }

    // 4) Upload new files (+ create NoticeDocument records)
    await _uploadDocuments(
      files: newDocuments,
      notice: saved,
      onProgress: onProgress,
      createDoc: (doc) => _db.create(doc),
    );

    // 5) Resolve & sync recipients (+ optional email)
    final recipients = await _findRecipients(
      aircraft: aircraft,
      roles: roles,
      manual: manualRecipients,
    );

    if (recipients.isNotEmpty) {
      await _upsertRecipients(
        notice: saved,
        initial: initial,
        newRecipients: recipients,
        resetReadOnSend: send,
      );

      if (send) {
        await _email.sendEmail(
          emailMessage: saved.toEmailMessage(),
          recipients: recipients.map((e) => e.email).toList(),
        );
      }
    }
  }

  Future<void> getFileURL(NoticeDocument doc, Notice notice) async {
    final res = await _storage.getFileUrl(doc.s3Path(notice));
    launchUrl(res.url);
  }

  // ---------- Private helpers ----------

  Future<void> _upsertRecipients({
    required Notice notice,
    required Notice? initial,
    required Iterable<Staff> newRecipients,
    required bool resetReadOnSend,
  }) async {
    final oldMap = {
      for (final old in initial?.recipients ?? const <NoticeStaff>[])
        old.staff!.id: old
    };

    final ops = <Future>[];
    for (final s in newRecipients) {
      final old = oldMap.remove(s.id);
      if (old == null) {
        ops.add(
            _db.create(NoticeStaff(notice: notice, staff: s, isRead: false)));
      } else if (resetReadOnSend) {
        ops.add(_db.update(
            NoticeStaff(id: old.id, notice: notice, staff: s, isRead: false)));
      }
    }
    ops.addAll(oldMap.values.map((old) => _db.delete(old)));
    await Future.wait(ops);
  }

  Future<void> _upsertAircraftNotices({
    required Notice notice,
    required Notice? initial,
    required List<Aircraft> newAircraft,
  }) async {
    if (initial == null) {
      await Future.wait(newAircraft.map(
        (a) => _db.create(AircraftNotice(aircraft: a, notice: notice)),
      ));
      return;
    }

    final oldMap = {
      for (final x in initial.aircraft ?? const <AircraftNotice>[])
        x.aircraft!.id: x
    };

    final creates = <Future>[];
    for (final a in newAircraft) {
      final old = oldMap.remove(a.id);
      if (old == null) {
        creates.add(_db.create(AircraftNotice(aircraft: a, notice: notice)));
      }
    }
    final deletes = oldMap.values.map((old) => _db.delete(old));
    await Future.wait([...creates, ...deletes]);
  }

  Future<void> _removeDocuments({
    required Notice initial,
    required List<NoticeDocument> keep,
  }) async {
    for (final doc in (initial.documents ?? const <NoticeDocument>[])) {
      if (!keep.contains(doc)) {
        await _storage.deleteFile(doc.s3Path(initial));
        await _db.delete(doc);
      }
    }
  }

  Future<void> _uploadDocuments({
    required List<PlatformFile> files,
    required Notice notice,
    required void Function(String fileName, double progress) onProgress,
    required Future<void> Function(NoticeDocument doc) createDoc,
  }) async {
    final uploads = <Future>[];
    for (final f in files) {
      final doc = NoticeDocument(name: f.name, notices: notice);
      await _db.create(doc);
      uploads.add(
        _storage.uploadFile(
          file: f,
          s3Path: doc.s3Path(notice),
          onProgress: (p) => onProgress(f.name, p.fractionCompleted),
        ),
      );
    }
    await Future.wait(uploads);
  }

  Future<Iterable<Staff>> _findRecipients({
    required List<Aircraft> aircraft,
    required List<Role> roles,
    required List<Staff> manual,
  }) async {
    if (aircraft.isEmpty || roles.isEmpty) return manual;

    final recipients = <Staff>[...manual];
    final res = await _db.query(
      document: listJoinRecipientsGraphQL,
      variables: {
        "aircraftFilter": {
          "or": aircraft
              .map((a) => {
                    "aircraftId": {"eq": a.id}
                  })
              .toList()
        },
        "rolesFilter": {
          "or": roles
              .map((r) => {
                    "roleId": {"eq": r.id}
                  })
              .toList()
        },
      },
    );

    for (final e in (res["listStaff"]["items"] as List)) {
      final s = Staff.fromJson(e);
      if ((s.aircraft?.isNotEmpty ?? false) && (s.roles?.isNotEmpty ?? false)) {
        recipients.add(s);
      }
    }
    return recipients.fold<Map<String, Staff>>({}, (m, s) {
      m.putIfAbsent(s.id, () => s);
      return m;
    }).values;
  }
}
