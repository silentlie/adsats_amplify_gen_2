import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
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
    var document = Document(
      name: file.name,
      archived: archived,
      staff: staff,
      subcategory: subcategory,
      issuedAt: issuedAt,
      expiredAt: expiredAt,
    );
    document = await _db.create(document);
    final fileUploadFuture = _storage.uploadFile(
      file: file,
      s3Path: document.s3Path,
      onProgress: (progress) {
        onProgressUpdate(file.name, progress.fractionCompleted);
      },
    );
    final aircraftDocumentFutures = aircraft.map((aircraft) {
      return _db.create(
        AircraftDocument(document: document, aircraft: aircraft),
      );
    }).toList();

    await Future.wait([
      fileUploadFuture,
      ...aircraftDocumentFutures,
    ]);
    return document;
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
    await _storage.deleteFile(document.s3Path);
    return await _db.delete(document);
  }

  Future<void> rename(Document document, Document newDocument) async {
    await _storage.copyFile(document.s3Path, newDocument.s3Path);
    await _storage.deleteFile(document.s3Path);
  }
}
