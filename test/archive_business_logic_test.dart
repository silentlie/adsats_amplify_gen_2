import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_notification_email_repository.dart';
import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/reminder_repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/data/repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/data/repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

final _aircraft = Aircraft(id: 'aircraft', name: 'Aircraft', archived: false);
final _role = Role(id: 'role', name: 'Pilot', archived: false);
final _notice = Notice(
  id: 'notice',
  subject: 'Notice',
  archived: false,
  details: '{}',
);

Staff _staff(
  String id, {
  bool archived = false,
  bool matchingAircraft = true,
  bool matchingRole = true,
}) {
  return Staff(
    id: id,
    firstName: id,
    lastName: 'Staff',
    email: '$id@example.com',
    archived: archived,
    aircraft: matchingAircraft ? [AircraftStaff(aircraft: _aircraft)] : [],
    roles: matchingRole ? [RoleStaff(role: _role)] : [],
  );
}

Map<String, dynamic> _staffJson(Staff staff) {
  return {
    'id': staff.id,
    'firstName': staff.firstName,
    'lastName': staff.lastName,
    'email': staff.email,
    'archived': staff.archived,
    'aircraft': {
      'items': [
        for (final link in staff.aircraft ?? <AircraftStaff>[]) {'id': link.id}
      ],
    },
    'roles': {
      'items': [
        for (final link in staff.roles ?? <RoleStaff>[]) {'id': link.id}
      ],
    },
  };
}

Document _document({
  bool archived = false,
  bool subcategoryArchived = false,
  bool categoryArchived = false,
}) {
  return Document(
    id: 'document',
    name: 'Document',
    archived: archived,
    subcategory: Subcategory(
      id: 'subcategory',
      name: 'Subcategory',
      archived: subcategoryArchived,
      category: Category(
        id: 'category',
        name: 'Category',
        archived: categoryArchived,
      ),
    ),
  );
}

Future<void> _saveNotice(
  _FakeDatabase db, {
  Notice? initial,
  List<Staff> manual = const [],
  List<Aircraft> aircraft = const [],
  List<Role> roles = const [],
}) {
  return NoticeRepository(
    db: db,
    storage: AmplifyS3API(),
    email: AmplifyNotificationEmailRepository(db),
  ).saveAndOptionallySend(
    draft: _notice,
    initial: initial,
    aircraft: aircraft,
    roles: roles,
    manualRecipients: manual,
    newDocuments: const [],
    keepDocuments: const [],
    send: true,
    onProgress: (_, __) {},
  );
}

void main() {
  group('SMS recipient eligibility', () {
    test('manual-only sends exclude archived staff and duplicate selections',
        () async {
      final db = _FakeDatabase();
      final active = _staff('active');

      await _saveNotice(db,
          manual: [active, _staff('archived', archived: true), active]);

      expect(db.created.whereType<NoticeStaff>().map((link) => link.staff!.id),
          ['active']);
      expect(db.queries, isEmpty);
      expect(db.emails, hasLength(1));
    });

    test(
        'archived manual recipients are removed from saved links without email',
        () async {
      final archived = _staff('archived', archived: true);
      final oldLink = NoticeStaff(
        id: 'old-link',
        notice: _notice,
        staff: archived,
        isRead: true,
      );
      final db = _FakeDatabase();

      await _saveNotice(
        db,
        initial: _notice.copyWith(recipients: [oldLink]),
        manual: [archived],
      );

      expect(db.created.whereType<NoticeStaff>(), isEmpty);
      expect(db.deleted.whereType<NoticeStaff>().map((link) => link.id),
          ['old-link']);
      expect(db.emails, isEmpty);
    });

    test(
        'automatic recipients require active staff and both active memberships',
        () async {
      final manual = _staff('manual');
      final automatic = _staff('automatic');
      final db = _FakeDatabase(response: {
        'listStaff': {
          'items': [
            _staffJson(automatic),
            _staffJson(manual),
            _staffJson(_staff('archived', archived: true)),
            _staffJson(_staff('no-aircraft', matchingAircraft: false)),
            _staffJson(_staff('no-role', matchingRole: false)),
            null,
          ],
        },
      });

      await _saveNotice(
        db,
        manual: [manual, _staff('archived-manual', archived: true)],
        aircraft: [_aircraft, _aircraft.copyWith(archived: true)],
        roles: [_role, _role.copyWith(archived: true)],
      );

      expect(db.created.whereType<NoticeStaff>().map((link) => link.staff!.id),
          ['manual', 'automatic']);
      final query = db.queries.single;
      expect(query.document,
          contains('listStaff(filter: {archived: {eq: false}}'));
      expect(query.variables, {
        'aircraftFilter': {
          'or': [
            {
              'aircraftId': {'eq': _aircraft.id}
            }
          ]
        },
        'rolesFilter': {
          'or': [
            {
              'roleId': {'eq': _role.id}
            }
          ]
        },
      });
    });

    for (final archivedSelection in ['aircraft', 'role']) {
      test('an archived $archivedSelection cannot resolve automatic recipients',
          () async {
        final db = _FakeDatabase();

        await _saveNotice(
          db,
          manual: [_staff('manual')],
          aircraft: [
            _aircraft.copyWith(archived: archivedSelection == 'aircraft')
          ],
          roles: [_role.copyWith(archived: archivedSelection == 'role')],
        );

        expect(db.queries, isEmpty);
        expect(
            db.created.whereType<NoticeStaff>().map((link) => link.staff!.id),
            ['manual']);
      });
    }
  });

  group('CMS compliance recipients', () {
    test(
        'archived roles and staff are excluded and active recipients are unique',
        () async {
      final active = _staff('active');
      Map<String, dynamic> roleJson(
          String id, bool archived, List<Staff> staff) {
        return {
          'id': id,
          'name': complianceManager,
          'archived': archived,
          'staff': {
            'items': [
              for (final person in staff)
                {'id': '$id-${person.id}', 'staff': _staffJson(person)},
              {'id': '$id-missing-staff', 'staff': null},
            ],
          },
        };
      }

      final db = _FakeDatabase(response: {
        'listRoles': {
          'items': [
            roleJson('archived-role', true, [_staff('from-archived-role')]),
            roleJson('active-role', false,
                [active, _staff('archived', archived: true)]),
            roleJson('second-active-role', false, [active]),
            null,
          ],
        },
      });

      final recipients = await ReportRepository(
        db: db,
        storage: AmplifyS3API(),
        email: AmplifyNotificationEmailRepository(db),
      ).fetchRecipientsForReport();

      expect(recipients.map((staff) => staff.id), ['active']);
      expect(db.queries.single.document,
          contains('name: {eq: \$roleName}, archived: {eq: false}'));
    });

    test('no active compliance role returns an empty recipient list', () async {
      final db = _FakeDatabase(response: {
        'listRoles': {'items': []}
      });
      final recipients = await ReportRepository(
        db: db,
        storage: AmplifyS3API(),
        email: AmplifyNotificationEmailRepository(db),
      ).fetchRecipientsForReport();
      expect(recipients, isEmpty);
    });
  });

  group('Flight crew eligibility', () {
    test('only active staff with the selected aircraft are returned', () async {
      final db = _FakeDatabase(response: {
        'getRole': {
          'archived': false,
          'staff': {
            'items': [
              {'staff': _staffJson(_staff('active'))},
              {'staff': _staffJson(_staff('archived', archived: true))},
              {
                'staff':
                    _staffJson(_staff('no-aircraft', matchingAircraft: false))
              },
              {'staff': null},
            ],
          },
        },
      });
      final staff =
          await FlightCrewRecordsRepository(db: db, storage: AmplifyS3API())
              .listJoinStaff(aircraft: _aircraft, role: _role);
      expect(staff.map((person) => person.id), ['active']);
    });

    for (final selectedRole in [
      null,
      {'archived': true}
    ]) {
      test('a missing or newly archived role returns no crew ($selectedRole)',
          () async {
        final db = _FakeDatabase(response: {'getRole': selectedRole});
        final staff =
            await FlightCrewRecordsRepository(db: db, storage: AmplifyS3API())
                .listJoinStaff(aircraft: _aircraft, role: _role);
        expect(staff, isEmpty);
      });
    }

    for (final archivedSelection in ['aircraft', 'role']) {
      test('archived $archivedSelection selections cannot return crew',
          () async {
        final db = _FakeDatabase();
        final staff =
            await FlightCrewRecordsRepository(db: db, storage: AmplifyS3API())
                .listJoinStaff(
          aircraft:
              _aircraft.copyWith(archived: archivedSelection == 'aircraft'),
          role: _role.copyWith(archived: archivedSelection == 'role'),
        );
        expect(staff, isEmpty);
        expect(db.queries, isEmpty);
      });
    }
  });

  group('Reminder creation eligibility', () {
    test('archived staff are excluded from reminder associations', () async {
      final db = _FakeDatabase();
      await ReminderRepository(db: db).createReminder(
        date: TemporalDateTime(DateTime.utc(2026, 10, 10)),
        document: _document(),
        staff: [_staff('active'), _staff('archived', archived: true)],
      );
      expect(db.created.whereType<ReminderStaff>().map((link) => link.staffId),
          ['active']);
    });

    for (final archivedLevel in ['document', 'subcategory', 'category']) {
      test('an archived $archivedLevel prevents reminder creation', () async {
        final db = _FakeDatabase();
        await expectLater(
          ReminderRepository(db: db).createReminder(
            date: TemporalDateTime(DateTime.utc(2026, 10, 10)),
            document: _document(
              archived: archivedLevel == 'document',
              subcategoryArchived: archivedLevel == 'subcategory',
              categoryArchived: archivedLevel == 'category',
            ),
            staff: [_staff('active')],
          ),
          throwsStateError,
        );
        expect(db.created, isEmpty);
      });
    }
  });

  group('Frontend role eligibility', () {
    for (final roleArchived in [false, true]) {
      for (final staffArchived in [false, true]) {
        test(
            'role flags require active staff and roles '
            '(staffArchived=$staffArchived, roleArchived=$roleArchived)',
            () async {
          final user = _staff('user', archived: staffArchived).copyWith(
            roles: [
              for (final name in [admin, safetyOfficer, complianceManager])
                RoleStaff(role: Role(name: name, archived: roleArchived)),
              RoleStaff(),
            ],
          );
          final container = ProviderContainer(overrides: [
            userDetailsProvider.overrideWith((ref) async => user),
          ]);
          addTearDown(container.dispose);
          await container.read(userDetailsProvider.future);
          final eligible = !staffArchived && !roleArchived;
          expect(container.read(isAdminProvider), eligible);
          expect(container.read(isSafetyOfficerProvider), eligible);
          expect(container.read(isComplianceManagerProvider), eligible);
        });
      }
    }

    test('an active role does not enable unrelated frontend role flags',
        () async {
      final user = _staff('user').copyWith(
        roles: [RoleStaff(role: Role(name: admin, archived: false))],
      );
      final container = ProviderContainer(overrides: [
        userDetailsProvider.overrideWith((ref) async => user),
      ]);
      addTearDown(container.dispose);
      await container.read(userDetailsProvider.future);
      expect(container.read(isAdminProvider), isTrue);
      expect(container.read(isSafetyOfficerProvider), isFalse);
      expect(container.read(isComplianceManagerProvider), isFalse);
    });
  });

  test('role queries load archive state needed by eligibility checks', () {
    expect(getStaffGraphQL,
        contains('role {\n          id\n          name\n          archived'));
    expect(listFlightCrewRecordsMetaGraphQL, contains('name\n      archived'));
  });
}

class _FakeDatabase extends AmplifyAppSyncAPI {
  _FakeDatabase({this.response = const {}});

  final Map<String, dynamic> response;
  final queries = <({String document, Map<String, dynamic> variables})>[];
  final created = <Model>[];
  final updated = <Model>[];
  final deleted = <Model>[];
  final emails = <Map<String, dynamic>>[];

  @override
  Future<Map<String, dynamic>> query({
    required String document,
    Map<String, dynamic> variables = const {},
    void Function(void Function())? bindCancel,
  }) async {
    queries.add((document: document, variables: variables));
    return response;
  }

  @override
  Future<T> create<T extends Model>(T model) async {
    created.add(model);
    return model;
  }

  @override
  Future<T> update<T extends Model>(T model) async {
    updated.add(model);
    return model;
  }

  @override
  Future<T> delete<T extends Model>(T model) async {
    deleted.add(model);
    return model;
  }

  @override
  Future<Map<String, dynamic>> mutate({
    required String document,
    required Map<String, dynamic> variables,
  }) async {
    emails.add(variables);
    return {};
  }
}
