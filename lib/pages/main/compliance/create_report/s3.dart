import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> getReportDocumentFileUrl(
    ReportDocument document, Report report) async {
  try {
    final result = await Amplify.Storage.getUrl(
      path: StoragePath.fromString(
        "reportDocuments/${report.id}/${document.id}/${document.name}",
      ),
      options: const StorageGetUrlOptions(
        pluginOptions: S3GetUrlPluginOptions(
          validateObjectExistence: true,
          expiresIn: Duration(days: 1),
        ),
      ),
    ).result;
    // debugPrint('url: ${result.url}');
    launchUrl(result.url);
  } on StorageException catch (e) {
    debugPrint('get report document url in s3 failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}

Future<void> uploadReportDocumentFile(PlatformFile file, Report report) async {
  final reportDocument = ReportDocument(name: file.name, reports: report);
  try {
    final response = await Amplify.API
        .mutate(request: ModelMutations.create(reportDocument))
        .response;
    String id = response.data!.id;
    debugPrint("document.id: $id");
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(file.readStream!, size: file.size),
      path: StoragePath.fromString(
          "reportDocuments/${report.id}/$id/${file.name}"),
      onProgress: (progress) {
        // Optional debug print for progress
        debugPrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;
    debugPrint('Successfully uploaded file: ${result.uploadedItem.path}');
  } on StorageException catch (e) {
    debugPrint('Storage Exception: ${e.message} ,${e.recoverySuggestion}');
  } on ApiException catch (e) {
    debugPrint('create report document failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}

Future<void> deleteReportDocumentFile(
    ReportDocument reportDocument, Report report) async {
  try {
    final request = ModelMutations.deleteById(
      ReportDocument.classType,
      ReportDocumentModelIdentifier(id: reportDocument.id),
    );
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // final result =
    await Amplify.Storage.remove(
      path: StoragePath.fromString(
        'reportDocuments/${report.id}/${reportDocument.id}/${reportDocument.name}',
      ),
    ).result;
    // print('Removed file: ${result.removedItem.path}');
  } on StorageException catch (e) {
    debugPrint('delete report document in s3 failed: ${e.message}');
  } on ApiException catch (e) {
    debugPrint(
        'delete report document in graphQL/Appsync failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}
