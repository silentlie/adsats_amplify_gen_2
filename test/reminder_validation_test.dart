import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/reminder_repository.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/models/reminder.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/reminder_form.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

Staff _staff({bool archived = false}) => Staff(
      id: archived ? 'archived' : 'active',
      firstName: archived ? 'Archived' : 'Active',
      lastName: 'Staff',
      email: 'test@example.com',
      archived: archived,
    );

void main() {
  final now = DateTime.utc(2026, 10, 5);
  final date = TemporalDateTime(DateTime.utc(2027, 1, 1));

  for (final staff in [
    <Staff>[],
    [_staff(archived: true)]
  ]) {
    test('a reminder needs an active recipient (${staff.length} selections)',
        () {
      final state = ReminderFormState(reminderDate: date, selectedStaff: staff);

      final validated = state.validate(now: now);

      expect(validated.dateValidationError, isNull);
      expect(validated.staffValidationError,
          ReminderFormState.staffRequiredMessage);
      expect(validated.toResult(now: now), isNull);
    });

    test(
        'the repository rejects ${staff.length} eligible-empty selections before writing',
        () async {
      final db = _ReminderDatabase();

      await expectLater(
        ReminderRepository(db: db).createReminder(
          date: date,
          document: Document(name: 'Manual.pdf', archived: false),
          staff: staff,
        ),
        throwsStateError,
      );

      expect(db.created, isEmpty);
    });
  }

  test('choosing an active recipient clears the validation error', () {
    final state = ReminderFormState(reminderDate: date).validate(now: now);
    final active = _staff();

    final corrected =
        state.copyWith(selectedStaff: [active]).validate(now: now);

    expect(corrected.staffValidationError, isNull);
    expect(corrected.dateValidationError, isNull);
    expect(corrected.toResult(now: now)?.staff, [active]);
    expect(corrected.toResult(now: now)?.dates, [date]);
  });

  test('valid reminder results omit archived selections', () {
    final active = _staff();
    final state = ReminderFormState(
      reminderDate: date,
      selectedStaff: [active, _staff(archived: true)],
    );

    expect(state.toResult(now: now)?.staff, [active]);
  });

  test('an active recipient still requires a reminder date', () {
    final state =
        ReminderFormState(selectedStaff: [_staff()]).validate(now: now);

    expect(state.staffValidationError, isNull);
    expect(state.dateValidationError, ReminderFormState.dateRequiredMessage);
    expect(state.toResult(now: now), isNull);
  });

  testWidgets(
      'recipient validation is visible and clears when a recipient is chosen',
      (tester) async {
    var state = ReminderFormState(reminderDate: date).validate(now: now);
    await tester.pumpWidget(ProviderScope(
      overrides: [
        listStaffProvider().overrideWith((ref) async => [_staff()])
      ],
      child: MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
              builder: (context, setState) => ReminderForm(
                    state: state,
                    onChanged: (next) => setState(() => state = next),
                  )),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text(ReminderFormState.staffRequiredMessage), findsOneWidget);

    await tester.tap(find.text('Tap to select'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Active Staff'));
    await tester.pumpAndSettle();

    expect(state.staffValidationError, isNull);
    expect(
        state.toResult(now: now)?.staff.map((person) => person.id), ['active']);
    expect(tester.takeException(), isNull);
  });
}

class _ReminderDatabase extends AmplifyAppSyncAPI {
  final created = <Model>[];

  @override
  Future<T> create<T extends Model>(T model) async {
    created.add(model);
    return model;
  }
}
