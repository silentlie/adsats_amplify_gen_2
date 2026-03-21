import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/reminder_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_service.g.dart';

@Riverpod(keepAlive: true)
ReminderRepository reminderService(Ref ref) {
  return ReminderRepository(
    db: ref.read(databaseAPIProvider),
  );
}
