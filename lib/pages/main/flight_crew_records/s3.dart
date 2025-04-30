import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> getFlightCrewRecordFileUrl(
    FlightCrewRecord flightCrewRecord) async {
  try {
    String pathStr =
        "flightCrewRecords/${flightCrewRecord.staff!.id}/${flightCrewRecord.id}/${flightCrewRecord.name}";

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
  FlightCrewRecordCategory category,
  bool archived,
  TemporalDateTime? issuedAt,
  TemporalDateTime? expiredAt,
  void Function(String fileName, double progress) onProgressUpdate,
) async {
  await Future.wait(
    selectedFiles.map(
      (file) => uploadFlightCrewRecordFile(
        file,
        staff,
        category,
        archived,
        issuedAt,
        expiredAt,
        onProgressUpdate
      ),
    ),
  );
}

Future<void> uploadFlightCrewRecordFile(
  PlatformFile file,
  Staff staff,
  FlightCrewRecordCategory category,
  bool archived,
  TemporalDateTime? issuedAt,
  TemporalDateTime? expiredAt,
  void Function(String fileName, double progress) onProgressUpdate,
) async {
  try {
    final flightCrewRecord = FlightCrewRecord(
      name: file.name,
      archived: archived,
      staff: staff,
      category: category,
      issuedAt: issuedAt,
      expiredAt: expiredAt,
    );
    // Create the flightCrewRecord and get its ID
    final response = await Amplify.API
        .mutate(request: ModelMutations.create(flightCrewRecord))
        .response;

    String id = response.data!.id;
    debugPrint("flightCrewRecord.id: $id");
    // Concurrently upload the file and create AircraftFlightCrewRecord entries
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(file.readStream!, size: file.size),
      path: StoragePath.fromString(
          "flightCrewRecords/${staff.id}/$id/${file.name}"),
      onProgress: (progress) {
        onProgressUpdate(file.name, progress.fractionCompleted);
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

Future<void> archive(FlightCrewRecord flightCrewRecord) async {
  try {
    final newFlightCrewRecord =
        flightCrewRecord.copyWith(archived: !flightCrewRecord.archived);
    final request = ModelMutations.update(newFlightCrewRecord);
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

Future<void> deleteFlightCrewRecord(FlightCrewRecord flightCrewRecord) async {
  try {
    final request = ModelMutations.deleteById(
      FlightCrewRecord.classType,
      FlightCrewRecordModelIdentifier(id: flightCrewRecord.id),
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
          'flightCrewRecords/${flightCrewRecord.staff!.id}/${flightCrewRecord.id}/${flightCrewRecord.name}'),
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

Future<void> renameFlightCrewRecord(
    FlightCrewRecord flightCrewRecord, String newName) async {
  try {
    await Amplify.Storage.copy(
      source: StoragePath.fromString(
          'flightCrewRecords/${flightCrewRecord.id}/${flightCrewRecord.name}'),
      destination: StoragePath.fromString(
          'flightCrewRecords/${flightCrewRecord.id}/$newName'),
    ).result.then(
      (value) async {
        await Amplify.Storage.remove(
          path: StoragePath.fromString(
              'flightCrewRecords/${flightCrewRecord.id}/${flightCrewRecord.name}'),
        ).result;
        // print('Removed file: ${result.removedItem.path}');
        return value;
      },
    );
    // print('Copy file: ${result.url}');
  } on StorageException catch (e) {
    debugPrint('rename flightCrewRecord in s3 failed: ${e.message}');
  } on ApiException catch (e) {
    debugPrint(
        'rename flightCrewRecord in graphQL/Appsync failed: ${e.message}');
  } catch (e) {
    debugPrint('Unknown Error: $e');
  }
}
