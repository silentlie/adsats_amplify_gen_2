import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/helper/storage/rename_file.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/reminder_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentsRepository {
  final AmplifyAppSyncAPI _db;
  final AmplifyS3API _storage;

  DocumentsRepository({
    required AmplifyAppSyncAPI db,
    required AmplifyS3API storage,
  })  : _storage = storage,
        _db = db;

  Future<void> getFileUrl(Document document) async {
    final result = await _storage.getFileUrl(document.s3Path);
    await launchUrl(result.url);
  }

  Future<List<Document>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    // Fetch documents from the database
    final res = await _db.query(
      document: listDocumentsGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (res["listDocuments"]["items"] as List).map(
      (document) {
        return Document.fromJson(document);
      },
    ).toList();
  }

  Future<Document> upload(
    PlatformFile file,
    Staff staff,
    Subcategory subcategory,
    List<Aircraft> aircraft,
    bool archived,
    TemporalDateTime? issuedAt,
    TemporalDateTime? expiredAt,
    void Function(String fileName, double progress) onProgressUpdate,
  ) async {
    final document = Document(
      name: file.name,
      archived: archived,
      staff: staff,
      subcategory: subcategory,
      issuedAt: issuedAt,
      expiredAt: expiredAt,
    );

    final s3Path = document.s3Path;

    await _storage.uploadFile(
      file: file,
      s3Path: s3Path,
      onProgress: (progress) {
        onProgressUpdate(
          file.name,
          progress.fractionCompleted,
        );
      },
    );

    Document? createdDocument;
    final createdAircraftDocuments = <AircraftDocument>[];

    try {
      createdDocument = await _db.create(document);

      for (final aircraftItem in aircraft) {
        final aircraftDocument = await _db.create(
          AircraftDocument(
            document: createdDocument,
            aircraft: aircraftItem,
          ),
        );

        createdAircraftDocuments.add(aircraftDocument);
      }

      return createdDocument;
    } catch (e) {
      for (final aircraftDocument in createdAircraftDocuments.reversed) {
        try {
          await _db.delete(aircraftDocument);
        } catch (_) {
          // Log cleanup failure.
        }
      }

      if (createdDocument != null) {
        try {
          await _db.delete(createdDocument);
        } catch (_) {
          // Log cleanup failure.
        }
      }

      try {
        await _storage.deleteFile(s3Path);
      } catch (_) {
        // Log cleanup failure.
      }

      rethrow;
    }
  }

  Future<List<Document>> uploadBatch(
    List<PlatformFile> selectedFiles,
    Staff staff,
    Subcategory subcategory,
    List<Aircraft> aircraft,
    bool archived,
    TemporalDateTime? issuedAt,
    TemporalDateTime? expiredAt,
    void Function(String fileName, double progress) onProgressUpdate,
  ) async {
    return await Future.wait(
      selectedFiles.map(
        (file) => upload(
          file,
          staff,
          subcategory,
          aircraft,
          archived,
          issuedAt,
          expiredAt,
          onProgressUpdate,
        ),
      ),
    );
  }

  Future<Document> update(Document document) async {
    return _db.update(document);
  }

  Future<Document> archive(Document document) async {
    return _db.update(document.copyWith(archived: !document.archived));
  }

  Future<Document> delete(Document document) async {
    final reminders = await _db.listAll<Reminder>(
      modelType: Reminder.classType,
      where: Reminder.DOCUMENT.eq(document.id),
    );
    final aircraftDocuments = await _db.listAll<AircraftDocument>(
      modelType: AircraftDocument.classType,
      where: AircraftDocument.DOCUMENT.eq(document.id),
    );
    final reminderRepository = ReminderRepository(db: _db);

    await _storage.deleteFile(document.s3Path);

    for (final reminder in reminders) {
      await reminderRepository.deleteReminderCascade(reminder: reminder);
    }

    for (final aircraftDocument in aircraftDocuments) {
      await _db.delete(aircraftDocument);
    }

    return _db.delete(document);
  }

  Future<Document> rename(Document document, Document newDocument) {
    return renameFile(
      storage: _storage,
      sourcePath: document.s3Path,
      destinationPath: newDocument.s3Path,
      save: () => _db.update(newDocument),
    );
  }
}
