import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_email_repository.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/email_content_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

final class ReportRepository {
  final AmplifyAppSyncAPI _db;
  final AmplifyS3API _storage;
  final AmplifyEmailRepository _email;

  ReportRepository({
    required AmplifyAppSyncAPI db,
    required AmplifyS3API storage,
    required AmplifyEmailRepository email,
  })  : _email = email,
        _storage = storage,
        _db = db;

  Future<Report> getById(String id) async {
    final res = await _db
        .query(document: getReportDetailsGraphQL, variables: {"id": id});
    return Report.fromJson(res["getReport"]);
  }

  Future<List<String>> listIdsForUser(String userId) async {
    final ids = await _db.listAll(
      modelType: ReportStaff.classType,
      where: ReportStaff.STAFF.eq(userId),
    );
    return ids.map((e) => e.report!.id).toList();
  }

  Future<List<Report>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final res = await _db.query(
      document: listReportsGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res["listReports"]["items"] as List)
        .map((e) => Report.fromJson(e))
        .toList();
  }

  Future<Report> create(Report report) async {
    return _db.create(report);
  }

  Future<Report> archive(Report report) async {
    return _db.update(report.copyWith(archived: !report.archived));
  }

  Future<Report> delete(Report report) async {
    final res = await _db.query(
      document: getReportDetailsGraphQL,
      variables: {"id": report.id},
    );
    report = Report.fromJson(res["getReport"]);
    final futures = <Future>[];
    futures.addAll(
        (report.recipients ?? const <ReportStaff>[]).map((r) => _db.delete(r)));
    futures.add(_removeDocuments(
      initial: report,
      keep: const <ReportDocument>[],
    ));
    await Future.wait(futures);
    return report;
  }

  Future<void> saveAndOptionallySend({
    required Report report,
    required Report? initial,
    required List<PlatformFile> newDocuments,
    required List<ReportDocument> keepDocuments,
    required bool send,
    required void Function(String fileName, double progress) onProgress,
  }) async {
    // Upsert report
    final savedReport =
        initial == null ? await create(report) : await _db.update(report);

    // Remove old documents
    if (initial != null) {
      await _removeDocuments(
        initial: initial,
        keep: keepDocuments,
      );
    }

    // Upload new documents
    await _uploadDocuments(
      files: newDocuments,
      report: savedReport,
      onProgress: onProgress,
      createDoc: (doc) async => await _db.create(doc),
    );

    final recipients = await fetchRecipientsForReport();

    // Upsert recipients
    await _upsertRecipients(
      report: savedReport,
      initial: initial,
      newRecipients: recipients,
      resetReadOnSend: send,
    );

    // Optionally send email
    if (send) {
      await _email.sendEmail(
        emailMessage: report.toEmailMessage(),
        recipients: recipients.map((e) => e.email).toList(),
      );
    }
  }

  Future<void> getFileURL(ReportDocument doc, Report report) async {
    final res = await _storage.getFileUrl(doc.s3Path(report));
    launchUrl(res.url);
  }

  Future<List<Staff>> fetchRecipientsForReport() async {
    final res = await _db.query(
      document: listStaffByRoleGraphQL,
      variables: {"roleName": "Compliance Manager"},
    );
    return Role.fromJson(
      (res["listRoles"]["items"] as List).first,
    ).staff!.map((e) => e.staff!).toList();
  }

  Future<void> _uploadDocuments({
    required List<PlatformFile> files,
    required Report report,
    required void Function(String fileName, double progress) onProgress,
    required Future<void> Function(ReportDocument doc) createDoc,
  }) async {
    final uploads = <Future>[];
    for (final f in files) {
      final doc = ReportDocument(name: f.name, reports: report);
      await _db.create(doc);
      uploads.add(
        _storage.uploadFile(
          file: f,
          s3Path: doc.s3Path(report),
          onProgress: (p) => onProgress(f.name, p.fractionCompleted),
        ),
      );
    }
    await Future.wait(uploads);
  }

  Future<void> _removeDocuments({
    required Report initial,
    required List<ReportDocument> keep,
  }) async {
    for (final doc in (initial.documents ?? const <ReportDocument>[])) {
      if (!keep.contains(doc)) {
        await _storage.deleteFile(doc.s3Path(initial));
        await _db.delete(doc);
      }
    }
  }

  Future<void> _upsertRecipients({
    required Report report,
    required Report? initial,
    required List<Staff> newRecipients,
    required bool resetReadOnSend,
  }) async {
    final oldMap = {
      for (final old in initial?.recipients ?? const <ReportStaff>[])
        old.staff!.id: old
    };

    final ops = <Future>[];
    for (final s in newRecipients) {
      final old = oldMap.remove(s.id);
      if (old == null) {
        ops.add(_db.create(ReportStaff(report: report, staff: s)));
      } else if (resetReadOnSend) {
        ops.add(_db.update(ReportStaff(id: old.id, report: report, staff: s)));
      }
    }
    ops.addAll(oldMap.values.map((old) => _db.delete(old)));
    await Future.wait(ops);
  }
}
