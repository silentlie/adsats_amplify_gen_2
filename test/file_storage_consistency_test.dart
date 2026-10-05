import 'dart:typed_data';

import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_notification_email_repository.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/data/repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';

final _staff = Staff(
  id: 'staff',
  firstName: 'Test',
  lastName: 'Staff',
  email: 'test@example.com',
  archived: false,
);
final _document = Document(id: 'document', name: 'Old.pdf', archived: false);
final _record = FlightCrewRecord(
  id: 'record',
  name: 'Old.pdf',
  archived: false,
  staff: _staff,
);
final _notice =
    Notice(id: 'notice', subject: 'Notice', details: '{}', archived: false);

String _path(Model model) => switch (model) {
      Document() => model.s3Path,
      FlightCrewRecord() => model.s3Path,
      NoticeDocument() => model.s3Path(model.notices!),
      _ => throw ArgumentError('Not a file record'),
    };

PlatformFile _file(String name) => _MemoryFile(name);

final class _MemoryFile extends PlatformFile {
  _MemoryFile(this.name);

  @override
  final String name;
  final _bytes = Uint8List.fromList([1, 2]);

  @override
  Uri get uri => Uri.dataFromBytes(_bytes);

  @override
  Never get xFile =>
      throw UnimplementedError('Storage is faked in these tests');

  @override
  int lengthSync() => _bytes.length;

  @override
  Future<int> length() async => _bytes.length;

  @override
  Future<Uint8List> readAsBytes() async => _bytes;

  @override
  Stream<Uint8List> readAsByteStream() => Stream.value(_bytes);
}

void main() {
  final cases = <({
    String name,
    Model initial,
    Model edited,
    Future<Model> Function(_FileDatabase, _FileStorage, Model) rename,
  })>[
    (
      name: 'Document',
      initial: _document,
      edited: _document.copyWith(name: 'New.pdf', archived: true),
      rename: (db, storage, edited) =>
          DocumentsRepository(db: db, storage: storage)
              .rename(_document, edited as Document),
    ),
    (
      name: 'FCR',
      initial: _record,
      edited: _record.copyWith(name: 'New.pdf', archived: true),
      rename: (db, storage, edited) =>
          FlightCrewRecordsRepository(db: db, storage: storage)
              .rename(_record, edited as FlightCrewRecord),
    ),
  ];

  for (final scenario in cases) {
    group('${scenario.name} rename', () {
      late _FileStorage storage;
      late _FileDatabase db;
      late String oldPath;
      late String newPath;
      setUp(() {
        oldPath = _path(scenario.initial);
        newPath = _path(scenario.edited);
        storage = _FileStorage()..objects.add(oldPath);
        db = _FileDatabase(storage)..saved = scenario.initial;
      });

      test('copies, saves all metadata, then removes the old object', () async {
        final saved = await scenario.rename(db, storage, scenario.edited);

        expect(saved, same(scenario.edited));
        expect(db.saved, same(scenario.edited));
        expect(db.updated, [scenario.edited]);
        expect(storage.objects, {newPath});
        expect(storage.events, [
          'copy:$oldPath->$newPath',
          'save:$newPath',
          'remove:$oldPath',
        ]);
      });

      test('copy failure preserves the old file and metadata', () async {
        storage.copyError = StateError('Copy failed');

        await expectLater(scenario.rename(db, storage, scenario.edited),
            throwsA(same(storage.copyError)));

        expect(db.saved, same(scenario.initial));
        expect(db.updated, isEmpty);
        expect(storage.objects, {oldPath});
        expect(storage.removed, isEmpty);
      });

      test('metadata failure keeps the old object and rolls back the new copy',
          () async {
        db.updateError = StateError('Metadata update failed');

        await expectLater(scenario.rename(db, storage, scenario.edited),
            throwsA(same(db.updateError)));

        expect(db.saved, same(scenario.initial));
        expect(storage.objects, {oldPath});
        expect(storage.removed, [newPath]);
      });

      test(
          'rollback failure preserves the original metadata error and old file',
          () async {
        db.updateError = StateError('Metadata update failed');
        storage.deleteErrors[newPath] = StateError('Rollback failed');

        await expectLater(scenario.rename(db, storage, scenario.edited),
            throwsA(same(db.updateError)));

        expect(db.saved, same(scenario.initial));
        expect(storage.objects, {oldPath, newPath});
        expect(storage.removed, isEmpty);
      });

      test(
          'old-object cleanup failure still returns the committed new metadata',
          () async {
        storage.deleteErrors[oldPath] = StateError('Cleanup failed');

        final saved = await scenario.rename(db, storage, scenario.edited);

        expect(saved, same(scenario.edited));
        expect(db.saved, same(scenario.edited));
        expect(storage.objects, {oldPath, newPath});
      });

      test('an unchanged path updates metadata without copying or deleting it',
          () async {
        await scenario.rename(db, storage, scenario.initial);

        expect(db.updated, [scenario.initial]);
        expect(storage.objects, {oldPath});
        expect(storage.events, ['save:$oldPath']);
      });
    });
  }

  group('SMS attachment uploads', () {
    late _FileStorage storage;
    late _FileDatabase db;
    final progress = <({String name, double fraction})>[];

    setUp(() {
      storage = _FileStorage();
      db = _FileDatabase(storage);
      progress.clear();
    });

    Future<void> save(List<PlatformFile> files) => NoticeRepository(
          db: db,
          storage: storage,
          email: AmplifyNotificationEmailRepository(db),
        ).saveAndOptionallySend(
          draft: _notice,
          initial: null,
          aircraft: const [],
          roles: const [],
          manualRecipients: const [],
          newDocuments: files,
          keepDocuments: const [],
          send: false,
          onProgress: (name, fraction) =>
              progress.add((name: name, fraction: fraction)),
        );

    test('uploads before exposing each attachment record and reports progress',
        () async {
      await save([_file('Attachment.pdf')]);

      final doc = db.attachments.single;
      expect(storage.objects, {_path(doc)});
      expect(storage.events, ['upload:${_path(doc)}', 'create:${_path(doc)}']);
      expect(progress, [(name: 'Attachment.pdf', fraction: 1.0)]);
    });

    test('an upload failure creates no attachment metadata', () async {
      storage.uploadError = StateError('Upload failed');

      await expectLater(
          save([_file('Attachment.pdf')]), throwsA(same(storage.uploadError)));

      expect(db.attachments, isEmpty);
      expect(db.attachmentAttempts, isEmpty);
      expect(storage.objects, isEmpty);
    });

    test('an attachment metadata failure rolls back the uploaded object',
        () async {
      db.attachmentError = StateError('Attachment create failed');

      await expectLater(
          save([_file('Attachment.pdf')]), throwsA(same(db.attachmentError)));

      expect(db.attachments, isEmpty);
      expect(storage.objects, isEmpty);
      expect(storage.removed, [_path(db.attachmentAttempts.single)]);
    });

    test('rollback failure retains the original attachment creation error',
        () async {
      db.attachmentError = StateError('Attachment create failed');
      storage.deleteError = StateError('Rollback failed');

      await expectLater(
          save([_file('Attachment.pdf')]), throwsA(same(db.attachmentError)));

      expect(db.attachments, isEmpty);
      expect(storage.objects, {_path(db.attachmentAttempts.single)});
    });

    test(
        'a failed batch upload does not break successful attachment references',
        () async {
      storage.uploadError = StateError('Upload failed');
      storage.failUploadName = 'Failed.pdf';

      await expectLater(save([_file('Good.pdf'), _file('Failed.pdf')]),
          throwsA(same(storage.uploadError)));

      expect(db.attachments.map((doc) => doc.name), ['Good.pdf']);
      expect(storage.objects, {_path(db.attachments.single)});
    });
  });
}

class _FileDatabase extends AmplifyAppSyncAPI {
  _FileDatabase(this.storage);

  final _FileStorage storage;
  Model? saved;
  Object? updateError;
  Object? attachmentError;
  final updated = <Model>[];
  final attachments = <NoticeDocument>[];
  final attachmentAttempts = <NoticeDocument>[];

  @override
  Future<T> update<T extends Model>(T model) async {
    final path = _path(model);
    expect(storage.objects, contains(path));
    storage.events.add('save:$path');
    if (updateError != null) throw updateError!;
    saved = model;
    updated.add(model);
    return model;
  }

  @override
  Future<T> create<T extends Model>(T model) async {
    if (model is NoticeDocument) {
      final path = _path(model);
      attachmentAttempts.add(model);
      expect(storage.objects, contains(path));
      storage.events.add('create:$path');
      if (attachmentError != null) throw attachmentError!;
      attachments.add(model);
    }
    return model;
  }
}

class _FileStorage extends AmplifyS3API {
  final objects = <String>{};
  final events = <String>[];
  final removed = <String>[];
  final deleteErrors = <String, Object>{};
  Object? deleteError;
  Object? copyError;
  Object? uploadError;
  String? failUploadName;

  @override
  Future<StorageCopyResult> copyFile(
      String sourceS3Path, String destinationS3Path) async {
    expect(objects, contains(sourceS3Path));
    events.add('copy:$sourceS3Path->$destinationS3Path');
    if (copyError != null) throw copyError!;
    objects.add(destinationS3Path);
    return StorageCopyResult(copiedItem: StorageItem(path: destinationS3Path));
  }

  @override
  Future<void> deleteFile(String s3Path) async {
    events.add('remove:$s3Path');
    final error = deleteErrors[s3Path] ?? deleteError;
    if (error != null) throw error;
    objects.remove(s3Path);
    removed.add(s3Path);
  }

  @override
  Future<StorageUploadFileResult> uploadFile({
    required PlatformFile file,
    required String s3Path,
    Function(StorageTransferProgress progress)? onProgress,
  }) async {
    events.add('upload:$s3Path');
    if (uploadError != null &&
        (failUploadName == null || file.name == failUploadName)) {
      throw uploadError!;
    }
    objects.add(s3Path);
    final size = (await file.length())!;
    onProgress?.call(StorageTransferProgress(
      transferredBytes: size,
      totalBytes: size,
      state: StorageTransferState.success,
    ));
    return StorageUploadFileResult(uploadedItem: StorageItem(path: s3Path));
  }
}
