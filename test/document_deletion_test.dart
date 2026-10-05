import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/s3_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter_test/flutter_test.dart';

final _document = Document(
  id: 'document',
  name: 'Manual.pdf',
  archived: false,
  aircraft: [AircraftDocument(id: 'aircraft-link')],
);
final _otherDocument = Document(
  id: 'other-document',
  name: 'Other.pdf',
  archived: false,
);

Reminder _reminder(String id, Document document) => Reminder(
      id: id,
      date: TemporalDateTime(DateTime.utc(2026, 10, 10)),
      document: document,
    );

String _key(Model model) =>
    '${model.getInstanceType().modelName()}:${model.modelIdentifier.serializeAsString()}';

void main() {
  late _DeletionDatabase db;
  late _DeletionStorage storage;
  late DocumentsRepository repository;
  late Reminder first;
  late Reminder second;
  late Reminder other;
  late List<ReminderStaff> targetLinks;
  late ReminderStaff otherLink;
  late List<AircraftDocument> targetAircraft;
  late AircraftDocument otherAircraft;

  setUp(() {
    final events = <String>[];
    first = _reminder('first', _document);
    second = _reminder('second', _document);
    other = _reminder('other', _otherDocument);
    targetLinks = [
      ReminderStaff(reminderId: first.id, staffId: 'active-staff'),
      ReminderStaff(
        reminderId: first.id,
        staffId: 'archived-staff',
        staff: Staff(
          id: 'archived-staff',
          firstName: 'Archived',
          lastName: 'Staff',
          email: 'archived@example.com',
          archived: true,
        ),
      ),
      ReminderStaff(reminderId: second.id, staffId: 'active-staff'),
    ];
    otherLink = ReminderStaff(reminderId: other.id, staffId: 'active-staff');
    targetAircraft = [
      AircraftDocument(id: 'aircraft-link', document: _document),
      AircraftDocument(
        id: 'archived-aircraft-link',
        document: _document,
        aircraft: Aircraft(name: 'Archived aircraft', archived: true),
      ),
    ];
    otherAircraft =
        AircraftDocument(id: 'other-aircraft', document: _otherDocument);
    db = _DeletionDatabase(
      events: events,
      rows: [
        first,
        second,
        other,
        ...targetLinks,
        otherLink,
        ...targetAircraft,
        otherAircraft
      ],
    );
    storage = _DeletionStorage(events);
    repository = DocumentsRepository(db: db, storage: storage);
  });

  void expectCompleteCleanup(Document document) {
    expect(db.deleted.whereType<Reminder>().map((item) => item.id),
        unorderedEquals([first.id, second.id]));
    expect(db.deleted.whereType<ReminderStaff>().map(_key),
        unorderedEquals(targetLinks.map(_key)));
    expect(db.rows, containsAll([other, otherLink, otherAircraft]));
    expect(db.deleted.whereType<AircraftDocument>().map((item) => item.id),
        unorderedEquals(targetAircraft.map((item) => item.id)));
    expect(
        db.deleted.whereType<Document>().map((item) => item.id), [document.id]);
    expect(storage.deleted, [document.s3Path]);

    for (final link in targetLinks) {
      final reminder = link.reminderId == first.id ? first : second;
      expect(db.events.indexOf('delete:${_key(link)}'),
          lessThan(db.events.indexOf('delete:${_key(reminder)}')));
      expect(db.events.indexOf('delete:${_key(reminder)}'),
          lessThan(db.events.indexOf('delete:${_key(document)}')));
    }
    for (final deleted in db.deleted.where((item) => item is! Subcategory)) {
      expect(db.events.indexOf('storage:${document.s3Path}'),
          lessThan(db.events.indexOf('delete:${_key(deleted)}')));
    }
  }

  for (final emptyCache in [false, true]) {
    test(
        'deleting a listed document cleans up reminders with '
        '${emptyCache ? 'an empty' : 'no'} reminder cache', () async {
      db.listedDocument['archived'] = emptyCache;
      final listed = (await repository.list(variables: const {})).single;
      expect(listed.reminders, isNull);
      final document =
          emptyCache ? listed.copyWith(reminders: const []) : listed;

      final deleted = await repository.delete(document);

      expect(deleted, same(document));
      expectCompleteCleanup(document);
    });
  }

  test('partial cached reminders and recipient links do not limit cleanup',
      () async {
    final cached = first.copyWith(staff: [targetLinks.first]);
    final document = _document.copyWith(reminders: [cached]);

    await repository.delete(document);

    expectCompleteCleanup(document);
  });

  test('a document containing only id and name cleans up every dependency',
      () async {
    final document =
        Document.fromJson({'id': _document.id, 'name': _document.name});

    await repository.delete(document);

    expectCompleteCleanup(document);
  });

  test('subcategory deletion cascades documents returned with only id and name',
      () async {
    final subcategory =
        Subcategory(id: 'subcategory', name: 'Manuals', archived: false);
    final service =
        SubcategoriesRepository(db: db, documentsRepository: repository);

    await service.delete(subcategory);

    expectCompleteCleanup(_document);
    expect(db.deleted.whereType<Subcategory>().map((item) => item.id),
        [subcategory.id]);
    expect(db.events.indexOf('delete:${_key(_document)}'),
        lessThan(db.events.indexOf('delete:${_key(subcategory)}')));
  });

  test('S3 deletion failure leaves all database records intact', () async {
    storage.failure = StateError('S3 deletion failed');
    final initialRows = List<Model>.of(db.rows);

    await expectLater(
        repository.delete(_document), throwsA(same(storage.failure)));

    expect(db.deleted, isEmpty);
    expect(db.rows, initialRows);
    expect(storage.deleted, isEmpty);
  });

  test('S3 failure during the subcategory cascade keeps the parent', () async {
    storage.failure = StateError('S3 deletion failed');
    final subcategory =
        Subcategory(id: 'subcategory', name: 'Manuals', archived: false);
    final service =
        SubcategoriesRepository(db: db, documentsRepository: repository);

    await expectLater(
        service.delete(subcategory), throwsA(same(storage.failure)));

    expect(db.deleted, isEmpty);
    expect(storage.deleted, isEmpty);
  });

  test('a document without reminders still deletes its aircraft links and file',
      () async {
    db.rows.removeWhere((item) =>
        item is Reminder && item.document?.id == _document.id ||
        item is ReminderStaff && item.reminderId != other.id);

    await repository.delete(_document);

    expect(db.deleted.whereType<Reminder>(), isEmpty);
    expect(db.deleted.whereType<ReminderStaff>(), isEmpty);
    expect(db.rows, containsAll([other, otherLink, otherAircraft]));
    expect(db.deleted.whereType<AircraftDocument>().map((item) => item.id),
        unorderedEquals(targetAircraft.map((item) => item.id)));
    expect(db.deleted.whereType<Document>().map((item) => item.id),
        [_document.id]);
    expect(storage.deleted, [_document.s3Path]);
  });

  for (final stage in [
    'reminder lookup',
    'aircraft lookup',
    'recipient lookup',
    'recipient deletion',
    'reminder deletion',
  ]) {
    test('$stage failure preserves the document database record', () async {
      switch (stage) {
        case 'reminder lookup':
          db.failListType = Reminder.classType.modelName();
        case 'aircraft lookup':
          db.failListType = AircraftDocument.classType.modelName();
        case 'recipient lookup':
          db.failListType = ReminderStaff.classType.modelName();
        case 'recipient deletion':
          db.failDeleteKey = _key(targetLinks.first);
        case 'reminder deletion':
          db.failDeleteKey = _key(first);
      }

      await expectLater(
          repository.delete(_document), throwsA(same(db.failure)));

      expect(db.deleted.whereType<Document>(), isEmpty);
      expect(db.deleted.whereType<AircraftDocument>(), isEmpty);
      expect(
          storage.deleted,
          stage == 'reminder lookup' || stage == 'aircraft lookup'
              ? isEmpty
              : [_document.s3Path]);
      expect(db.rows, containsAll([first, other, otherLink, otherAircraft]));
    });
  }
}

class _DeletionDatabase extends AmplifyAppSyncAPI {
  _DeletionDatabase({required this.events, required this.rows});

  final List<String> events;
  final List<Model> rows;
  final deleted = <Model>[];
  final failure = StateError('Reminder cleanup failed');
  String? failListType;
  String? failDeleteKey;
  final listedDocument = <String, dynamic>{
    'id': _document.id,
    'name': _document.name,
    'archived': _document.archived,
    'aircraft': {
      'items': [
        {'id': 'aircraft-link'},
      ],
    },
  };

  @override
  Future<Map<String, dynamic>> query({
    required String document,
    Map<String, dynamic> variables = const {},
    void Function(void Function())? bindCancel,
  }) async {
    if (document == getSubcategoryDetailsGraphQL) {
      expect(variables, {'id': 'subcategory'});
      return {
        'getSubcategory': {
          'id': 'subcategory',
          'documents': {
            'items': [
              {'id': _document.id, 'name': _document.name},
            ],
          },
        },
      };
    }
    expect(document, listDocumentsGraphQL);
    return {
      'listDocuments': {
        'items': [listedDocument],
      },
    };
  }

  @override
  Future<List<T>> listAll<T extends Model>({
    required ModelType<T> modelType,
    QueryPredicate? where,
    int limit = 10000,
    void Function(void Function())? bindCancel,
  }) async {
    if (modelType.modelName() == failListType) throw failure;
    return rows.whereType<T>().where((item) {
      if (where == null) return true;
      if (where is QueryPredicateOperation) {
        final value = item.toMap()[where.field];
        return where.queryFieldOperator
            .evaluate(value is Document ? value.id : value);
      }
      return where.evaluate(item);
    }).toList();
  }

  @override
  Future<T> delete<T extends Model>(T model) async {
    if (_key(model) == failDeleteKey) throw failure;
    deleted.add(model);
    events.add('delete:${_key(model)}');
    rows.removeWhere((item) => _key(item) == _key(model));
    return model;
  }
}

class _DeletionStorage extends AmplifyS3API {
  _DeletionStorage(this.events);

  final List<String> events;
  final deleted = <String>[];
  Object? failure;

  @override
  Future<void> deleteFile(String s3Path) async {
    if (failure != null) throw failure!;
    deleted.add(s3Path);
    events.add('storage:$s3Path');
  }
}
