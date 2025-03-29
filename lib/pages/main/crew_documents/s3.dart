import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> getFlightCrewRecordFileUrl(CrewDocument crewDocument) async {
  try {
    String pathStr =
        "crewDocuments/${crewDocument.staff!.id}/${crewDocument.id}/${crewDocument.name}";

    final result = await Amplify.Storage.getUrl(
      path: StoragePath.fromString(pathStr),
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
    debugPrint('get Flight Crew Records url in s3 failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}

Future<void> uploadFlightCrewRecordsFiles(
  List<PlatformFile> selectedFiles,
  Staff staff,
  CrewDocumentCategory category,
) async {
  await Future.wait(
    selectedFiles.map(
      (file) => uploadFlightCrewRecordFile(
        file,
        staff,
        category,
      ),
    ),
  );
}

Future<void> uploadFlightCrewRecordFile(
  PlatformFile file,
  Staff staff,
  CrewDocumentCategory category,
) async {
  try {
    final flightCrewRecord = CrewDocument(
      name: file.name,
      archived: false,
      staff: staff,
      category: category,
    );

    // Create the document and get its ID
    final response = await Amplify.API
        .mutate(request: ModelMutations.create(flightCrewRecord))
        .response;

    String id = response.data!.id;
    debugPrint("document.id: $id");
    // Concurrently upload the file and create AircraftDocument entries
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(file.readStream!, size: file.size),
      path:
          StoragePath.fromString("crewDocuments/${staff.id}/$id/${file.name}"),
      onProgress: (progress) {
        // Optional debug print for progress
        debugPrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;
    debugPrint('Successfully uploaded file: ${result.uploadedItem.path}');
  } on StorageException catch (e) {
    debugPrint('Storage Exception: ${e.message} ,${e.recoverySuggestion}');
  } on ApiException catch (e) {
    debugPrint('create Flight Crew Records failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}

Future<void> archive(CrewDocument crewDocument) async {
  try {
    final newDocument = crewDocument.copyWith(archived: !crewDocument.archived);
    final request = ModelMutations.update(newDocument);
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
  } on ApiException catch (e) {
    debugPrint('archive Flight Crew Records failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}

Future<void> deleteFlightCrewRecord(CrewDocument flightCrewRecord) async {
  try {
    final request = ModelMutations.deleteById(
      CrewDocument.classType,
      CrewDocumentModelIdentifier(id: flightCrewRecord.id),
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
          'crewDocuments/${flightCrewRecord.staff!.id}/${flightCrewRecord.id}/${flightCrewRecord.name}'),
    ).result;
    // print('Removed file: ${result.removedItem.path}');
  } on StorageException catch (e) {
    debugPrint('delete Flight Crew Records in s3 failed: ${e.message}');
  } on ApiException catch (e) {
    debugPrint(
        'delete Flight Crew Records in graphQL/Appsync failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}
