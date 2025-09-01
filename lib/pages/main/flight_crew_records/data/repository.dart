import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class FlightCrewRecordsRepository {
  final AmplifyAppSyncAPI _db;
  final AmplifyS3API _storage;

  FlightCrewRecordsRepository({
    required AmplifyAppSyncAPI db,
    required AmplifyS3API storage,
  })  : _storage = storage,
        _db = db;

  Future<void> getFileUrl(FlightCrewRecord record) async {
    final result = await _storage.getFileUrl(record.s3Path);
    await launchUrl(result.url);
  }

  Future<List<FlightCrewRecord>> list({
    required Map<String, dynamic> variables,
    void Function(void Function())? bindCancel,
  }) async {
    final result = await _db.query(
      document: listFlightCrewRecordsGraphQL,
      variables: variables,
      bindCancel: bindCancel,
    );
    return (result["listFlightCrewRecords"]["items"] as List).map(
      (document) {
        return FlightCrewRecord.fromJson(document);
      },
    ).toList();
  }

  Future<(Iterable<Aircraft>, Iterable<Role>)> meta({
    void Function(void Function())? bindCancel,
  }) async {
    final result = await _db.query(
      document: listFlightCrewRecordsMetaGraphQL,
      bindCancel: bindCancel,
    );
    final aircraft = (result["listAircraft"]["items"] as List)
        .map((item) => Aircraft.fromJson(item));
    final roles = (result["listRoles"]["items"] as List)
        .map((item) => Role.fromJson(item));
    return (aircraft, roles);
  }

  Future<Iterable<Staff>> listJoinStaff({
    required Aircraft aircraft,
    required Role role,
    void Function(void Function())? bindCancel,
  }) async {
    final result = await _db.query(
      document: listFlightCrewRecordsCrewsGraphQL,
      variables: {
        "aircraftId": aircraft.id,
        "roleId": role.id,
      },
      bindCancel: bindCancel,
    );
    print(result);
    return (result["getRole"]["staff"]["items"] as List)
        .map((e) => Staff.fromJson(e["staff"]))
        .where((element) => element.aircraft!.isNotEmpty);
  }

  Future<FlightCrewRecord> upload(
    PlatformFile file,
    Staff staff,
    FlightCrewRecordCategory category,
    bool archived,
    TemporalDateTime? issuedAt,
    TemporalDateTime? expiredAt,
    void Function(String fileName, double progress) onProgressUpdate,
  ) async {
    final record = FlightCrewRecord(
      name: file.name,
      archived: archived,
      staff: staff,
      category: category,
      issuedAt: issuedAt,
      expiredAt: expiredAt,
    );
    final result = await _db.create(record);
    await _storage.uploadFile(
        file: file,
        s3Path: result.s3Path,
        onProgress: (progress) {
          onProgressUpdate(file.name, progress.fractionCompleted);
        });
    return result;
  }

  Future<List<FlightCrewRecord>> uploadBatch(
    List<PlatformFile> selectedFiles,
    Staff staff,
    FlightCrewRecordCategory category,
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
          category,
          archived,
          issuedAt,
          expiredAt,
          onProgressUpdate,
        ),
      ),
    );
  }

  Future<FlightCrewRecord> archive(FlightCrewRecord record) async {
    final updatedRecord = record.copyWith(archived: !record.archived);
    return await _db.update(updatedRecord);
  }

  Future<FlightCrewRecord> update(FlightCrewRecord record) async {
    return await _db.update(record);
  }

  Future<FlightCrewRecord> delete(FlightCrewRecord record) async {
    await _storage.deleteFile(record.s3Path);
    return await _db.delete(record);
  }

  Future<void> rename(
      FlightCrewRecord record, FlightCrewRecord newRecord) async {
    await _storage.copyFile(record.s3Path, newRecord.s3Path);
    await _storage.deleteFile(record.s3Path);
  }
}
