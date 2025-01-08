import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<void> uploadFile(PlatformFile file, Notice notice) async {
  final noticeDocument = NoticeDocument(name: file.name, notices: notice);
  try {
    final response = await Amplify.API
        .mutate(request: ModelMutations.create(noticeDocument))
        .response;
    String id = response.data!.id;
    debugPrint("document.id: $id");
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(file.readStream!, size: file.size),
      path:
          StoragePath.fromString("crewDocuments/${notice.id}/$id/${file.name}"),
      onProgress: (progress) {
        // Optional debug print for progress
        debugPrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;
    debugPrint('Successfully uploaded file: ${result.uploadedItem.path}');
  } on StorageException catch (e) {
    debugPrint('Storage Exception: ${e.message} ,${e.recoverySuggestion}');
  } on ApiException catch (e) {
    debugPrint('create notice document failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}

Future<void> delete(NoticeDocument noticeDocument, Notice notice) async {
  try {
    final request = ModelMutations.deleteById(
      NoticeDocument.classType,
      NoticeDocumentModelIdentifier(id: noticeDocument.id),
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
          'noticeDocuments/${notice.id}/${noticeDocument.id}/${noticeDocument.name}'),
    ).result;
    // print('Removed file: ${result.removedItem.path}');
  } on StorageException catch (e) {
    debugPrint('delete notice document in s3 failed: ${e.message}');
  } on ApiException catch (e) {
    debugPrint(
        'delete notice document in graphQL/Appsync failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}
