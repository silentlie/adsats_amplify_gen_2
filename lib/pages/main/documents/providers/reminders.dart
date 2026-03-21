import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminder_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminders.g.dart';

@riverpod
Future<List<Reminder>> reminders(Ref ref, Document document) async {
  final service = ref.read(reminderServiceProvider);
  return service.listByDocument(document: document);
}
