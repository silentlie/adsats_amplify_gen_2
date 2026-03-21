import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class ReminderRepository {
  final AmplifyAppSyncAPI _db;

  ReminderRepository({
    required AmplifyAppSyncAPI db,
  }) : _db = db;

  Future<Reminder> createReminder({
    required TemporalDateTime date,
    required Document document,
    List<Staff> staff = const [],
  }) async {
    final reminder = await _db.create(
      Reminder(
        date: date,
        document: document,
      ),
    );

    await Future.wait([
      ...staff.map(
        (s) => _attachToStaff(
          reminder: reminder,
          staff: s,
        ),
      ),
    ]);

    return reminder;
  }

  Future<ReminderStaff> _attachToStaff({
    required Reminder reminder,
    required Staff staff,
  }) async {
    return _db.create(
      ReminderStaff(
        reminderId: reminder.id,
        staffId: staff.id,
        reminder: reminder,
        staff: staff,
      ),
    );
  }

  Future<List<Reminder>> listByDocument({
    required Document document,
    void Function(void Function())? bindCancel,
  }) async {
    final response = await _db.query(
      document: listRemindersGraphQL,
      variables: {
        'filter': {
          'documentId': {'eq': document.id},
        },
      },
      bindCancel: bindCancel,
    );
    return (response['listReminders']['items'] as List)
        .map((item) => Reminder.fromJson(item))
        .toList();
  }

  Future<Reminder> updateReminder(Reminder reminder) {
    return _db.update(reminder);
  }

  Future<void> deleteReminderCascade({
    required Reminder reminder,
  }) async {
    final staffLinks = await _db.listAll<ReminderStaff>(
      modelType: ReminderStaff.classType,
      where: ReminderStaff.REMINDERID.eq(reminder.id),
    );

    await Future.wait([
      ...staffLinks.map(_db.delete),
    ]);

    await _db.delete(reminder);
  }
}
