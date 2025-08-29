import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_email_repository.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/email_content_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeRepository {
  final AmplifyAppSyncAPI db;
  final AmplifyS3API s3;
  final AmplifyEmailRepository email;

  NoticeRepository({
    required this.db,
    required this.s3,
    required this.email,
  });

  Future<Notice> getById(String id) async {
    final res = await db.query(
      document: getNoticeDetailsGraphQL,
      variables: {"id": id},
    );
    return Notice.fromJson(res["getNotice"]);
  }

  Future<List<String>> listNoticeIdsForInbox(String staffId) async {
    final ids = await db.listAll(
      modelType: NoticeStaff.classType,
      where: NoticeStaff.STAFF.eq(staffId),
    );
    return ids.map((e) => e.notice!.id).toList();
  }

  Future<List<Notice>> getNotices(Map<String, dynamic> variables) async {
    final res = await db.query(
      document: listNoticesGraphQL,
      variables: variables,
    );
    return (res["listNotices"]["items"] as List)
        .map((notice) => Notice.fromJson(notice))
        .toList();
  }

  Future<Notice> deleteNotice(Notice notice) async {
    final res = await db.query(
      document: getNoticeDetailsGraphQL,
      variables: {"id": notice.id},
    );
    Notice returnNotice = Notice.fromJson(res["getNotice"]);
    final List<Future> futures = [];
    returnNotice.recipients?.forEach(
      (noticeStaff) => futures.add(db.delete(noticeStaff)),
    );
    returnNotice.aircraft?.forEach(
      (aircraftNotice) => futures.add(db.delete(aircraftNotice)),
    );
    futures.add(removeDocuments(
      initial: notice,
      keep: [],
      deleteFromStorage: (doc) async => await deleteFile(doc, notice),
    ));
    futures.add(db.delete(notice));
    await Future.wait(futures);
    return returnNotice;
  }

  Future<void> saveAndOptionallySend({
    required Notice draft,
    required Notice? initial,
    required List<Aircraft> aircraft,
    required List<Role> roles,
    required List<Staff> manualRecipients,
    required List<PlatformFile> selectedFiles,
    required List<NoticeDocument> keepDocuments,
    required bool send,
    required void Function(String name, double p) onProgress,
  }) async {
    // 1) Upsert notice
    final saved =
        initial == null ? await db.create(draft) : await db.update(draft);
    // 2) Aircraft links
    await upsertAircraftLinks(
      notice: saved,
      initial: initial,
      newAircraft: aircraft,
    );

    // 3) Remove deleted docs (delete storage first, then DB to avoid orphans)
    if (initial != null) {
      await removeDocuments(
        initial: initial,
        keep: keepDocuments,
        deleteFromStorage: (doc) => deleteFile(doc, initial),
      );
    }

    // 4) Upload new files (+ create NoticeDocument records)
    await uploadDocuments(
      files: selectedFiles,
      notice: saved,
      onProgress: onProgress,
      createDoc: (doc) async => db.create(doc),
    );

    // 5) Resolve & sync recipients
    final resolved = await findRecipients(
      aircraft: aircraft,
      roles: roles,
      manual: manualRecipients,
    );
    if (resolved.isNotEmpty) {
      await syncRecipients(
        notice: saved,
        initial: initial,
        newRecipients: resolved,
        resetReadOnSend: send,
      );
      if (send && resolved.isNotEmpty) {
        // final emailService = AmplifyEmailRepository(AmplifyAppSyncAPI());
        await email.sendEmail(
          emailMessage: saved.toEmailMessage(),
          recipients: resolved.map((e) => e.email).toList(),
        );
      }
    }
  }

  Future<void> syncRecipients({
    required Notice notice,
    required Notice? initial,
    required Iterable<Staff> newRecipients,
    required bool resetReadOnSend,
  }) async {
    final oldMap = {
      for (final old in initial?.recipients ?? <NoticeStaff>[])
        old.staff!.id: old
    };
    for (final s in newRecipients) {
      final old = oldMap.remove(s.id);
      if (old == null) {
        await db.create(NoticeStaff(notice: notice, staff: s));
      } else if (resetReadOnSend) {
        await db.update(NoticeStaff(id: old.id, notice: notice, staff: s));
      }
    }
    for (final old in oldMap.values) {
      await db.delete(old);
    }
  }

  Future<void> upsertAircraftLinks({
    required Notice notice,
    required Notice? initial,
    required List<Aircraft> newAircraft,
  }) async {
    if (initial == null) {
      for (final a in newAircraft) {
        await db.create(AircraftNotice(aircraft: a, notice: notice));
      }
      return;
    }
    final oldMap = {
      for (final x in initial.aircraft ?? <AircraftNotice>[]) x.aircraft!.id: x
    };
    for (final a in newAircraft) {
      final old = oldMap.remove(a.id);
      if (old == null) {
        await db.create(AircraftNotice(aircraft: a, notice: notice));
      }
    }
    for (final old in oldMap.values) {
      await db.delete(old);
    }
  }

  Future<void> getFileURL(NoticeDocument doc, Notice notice) async {
    final res = await s3.getFileUrl(doc.s3Path(notice));
    launchUrl(res.url);
  }

  Future<void> removeDocuments({
    required Notice initial,
    required List<NoticeDocument> keep,
    required Future<void> Function(NoticeDocument doc) deleteFromStorage,
  }) async {
    for (final doc in (initial.documents ?? const <NoticeDocument>[])) {
      if (!keep.contains(doc)) {
        await deleteFromStorage(doc);
        await db.delete(doc);
      }
    }
  }

  Future<void> uploadDocuments({
    required List<PlatformFile> files,
    required Notice notice,
    required void Function(String fileName, double progress) onProgress,
    required Future<void> Function(NoticeDocument doc) createDoc,
  }) async {
    for (final f in files) {
      final doc = NoticeDocument(name: f.name, notices: notice);
      await createDoc(doc);
      s3.uploadFile(
        file: f,
        s3Path: doc.s3Path(notice),
        onProgress: (p) => onProgress(f.name, p.fractionCompleted),
      );
    }
  }

  Future<void> deleteFile(NoticeDocument doc, Notice ofNotice) async {
    await s3.deleteFile(doc.s3Path(ofNotice));
  }

  Future<Iterable<Staff>> findRecipients({
    required List<Aircraft> aircraft,
    required List<Role> roles,
    required List<Staff> manual,
  }) async {
    if (aircraft.isEmpty || roles.isEmpty) return manual;

    final recipients = <Staff>[...manual];
    final res = await db.query(
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
      if (s.aircraft!.isNotEmpty && s.roles!.isNotEmpty) {
        recipients.add(s);
      }
    }
    return recipients.fold<Map<String, Staff>>({}, (m, s) {
      m.putIfAbsent(s.id, () => s);
      return m;
    }).values;
  }
}
