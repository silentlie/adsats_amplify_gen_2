import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/reminder.dart'
    as reminder_dialog;
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/reminder_tile.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminders.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminder_service.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Reminders extends ConsumerWidget {
  const Reminders({
    super.key,
    required this.document,
  });

  final Document document;

  Future<void> _deleteReminder(WidgetRef ref, Reminder reminder) async {
    await ref.read(reminderServiceProvider).deleteReminderCascade(
          reminder: reminder,
        );
    ref.invalidate(remindersProvider(document));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(remindersProvider(document));
    return AlertDialog.adaptive(
      title: Text('Pending reminders of ${document.name}'),
      content: AsyncValueWidget<List<Reminder>>(
        value: remindersAsync,
        data: (reminders) {
          if (reminders.isEmpty) {
            return const Center(child: Text('No reminders found'));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < reminders.length; i++) ...[
                  ReminderTile(
                    reminder: reminders[i],
                    onDelete: () => _deleteReminder(ref, reminders[i]),
                  ),
                  if (i < reminders.length - 1) const Divider(),
                ],
              ],
            ),
          );
        },
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          icon: const Icon(Icons.cancel_outlined),
          label: const Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return reminder_dialog.Reminder(document: document);
              },
            );
          },
          icon: const Icon(Icons.add_alert_outlined),
          label: const Text('Add new reminders'),
        ),
      ],
    );
  }
}
