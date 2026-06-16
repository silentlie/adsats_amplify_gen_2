import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart' hide Reminder;
import 'package:adsats_amplify_gen_2/pages/main/documents/models/reminder.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminder_service.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminders.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/reminder_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Reminder extends ConsumerStatefulWidget {
  const Reminder({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  ConsumerState<Reminder> createState() => _ReminderState();
}

class _ReminderState extends ConsumerState<Reminder> {
  late ReminderFormState reminderState;

  @override
  void initState() {
    super.initState();
    reminderState = ReminderFormState(expiredAt: widget.document.expiredAt);
  }

  Future<void> _createReminders() async {
    final validated = reminderState.validate();
    final result = validated.toResult();

    setState(() {
      reminderState = validated;
    });

    if (result == null) {
      return;
    }

    setState(() {
      reminderState = reminderState.copyWith(isSubmitting: true);
    });

    try {
      final service = ref.read(reminderServiceProvider);
      await Future.wait(
        result.dates.map(
          (date) => service.createReminder(
            date: date,
            document: widget.document,
            staff: result.staff,
          ),
        ),
      );

      ref.invalidate(remindersProvider(widget.document));
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } finally {
      setState(() {
        reminderState = reminderState.copyWith(isSubmitting: false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final expiredAt = widget.document.expiredAt;
    final title = expiredAt == null
        ? 'Create reminders for ${widget.document.name}'
        : 'Create reminders for ${widget.document.name}\nExpiry date: ${expiredAt.toCompactDateString}';

    return AlertDialog.adaptive(
      title: Text(title),
      content: SingleChildScrollView(
        child: ReminderForm(
          state: reminderState,
          onChanged: (value) {
            setState(() {
              reminderState = value;
            });
          },
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.cancel_outlined),
          label: const Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: reminderState.isSubmitting ? null : _createReminders,
          icon: const Icon(Icons.add_alert_outlined),
          label: const Text('Create reminder(s)'),
        ),
      ],
    );
  }
}
