import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    super.key,
    required this.reminder,
    required this.onDelete,
  });

  final Reminder reminder;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final recipients =
        reminder.staff?.map((e) => e.staff).whereType<Staff>().toList() ??
            const <Staff>[];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reminder date: ${reminder.date.toCompactDateString}'),
              const SizedBox(height: 6),
              recipients.isEmpty
                  ? const Text('Recipients: none')
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < recipients.length; i++) ...[
                            Chip(
                              label: Text(recipients[i].fullName),
                              visualDensity: VisualDensity.compact,
                            ),
                            if (i < recipients.length - 1)
                              const SizedBox(width: 8),
                          ],
                        ],
                      ),
                    ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'Delete reminder',
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline),
        ),
      ],
    );
  }
}
