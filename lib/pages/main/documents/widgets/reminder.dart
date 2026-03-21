import 'package:adsats_amplify_gen_2/constants/durations.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart' hide Reminder;
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminder_service.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminders.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
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
  bool ninetyDaysBefore = false;
  bool sixtyDaysBefore = false;
  bool thirtyDaysBefore = false;
  TemporalDateTime? reminderDate;
  List<Staff> selectedStaff = [];
  bool isSubmitting = false;
  String? dateValidationError;

  bool _isOffsetDateAvailable(int daysBefore) {
    final expiredAt = widget.document.expiredAt?.getDateTimeInUtc();
    if (expiredAt == null) return false;
    final candidate = expiredAt.subtract(Duration(days: daysBefore));
    return !candidate.isBefore(DateTime.now());
  }

  List<TemporalDateTime> _buildReminderDates() {
    final dates = <TemporalDateTime>[];
    final expiredAt = widget.document.expiredAt?.getDateTimeInUtc();

    if (expiredAt != null) {
      if (ninetyDaysBefore) {
        final candidate = expiredAt.subtract(const Duration(days: 90));
        if (!candidate.isBefore(DateTime.now())) {
          dates.add(TemporalDateTime(candidate));
        }
      }
      if (sixtyDaysBefore) {
        final candidate = expiredAt.subtract(const Duration(days: 60));
        if (!candidate.isBefore(DateTime.now())) {
          dates.add(TemporalDateTime(candidate));
        }
      }
      if (thirtyDaysBefore) {
        final candidate = expiredAt.subtract(const Duration(days: 30));
        if (!candidate.isBefore(DateTime.now())) {
          dates.add(TemporalDateTime(candidate));
        }
      }
    }

    if (reminderDate != null) {
      dates.add(reminderDate!);
    }

    final unique = <String, TemporalDateTime>{};
    for (final date in dates) {
      unique[date.getDateTimeInUtc().toIso8601String()] = date;
    }
    return unique.values.toList();
  }

  Future<void> _createReminders() async {
    final dates = _buildReminderDates();
    if (dates.isEmpty) {
      setState(() {
        dateValidationError = 'Please select at least one reminder date';
      });
      return;
    }

    setState(() {
      dateValidationError = null;
    });

    setState(() {
      isSubmitting = true;
    });

    try {
      final service = ref.read(reminderServiceProvider);
      await Future.wait(
        dates.map(
          (date) => service.createReminder(
            date: date,
            document: widget.document,
            staff: selectedStaff,
          ),
        ),
      );

      ref.invalidate(remindersProvider(widget.document));
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } finally {
      setState(() {
        isSubmitting = false;
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (expiredAt != null && _isOffsetDateAvailable(90))
              CheckboxListTile(
                value: ninetyDaysBefore,
                title: const Text('90 days before expiry date'),
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    ninetyDaysBefore = value ?? false;
                  });
                },
              ),
            if (expiredAt != null && _isOffsetDateAvailable(60))
              CheckboxListTile(
                value: sixtyDaysBefore,
                title: const Text('60 days before expiry date'),
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    sixtyDaysBefore = value ?? false;
                  });
                },
              ),
            if (expiredAt != null && _isOffsetDateAvailable(30))
              CheckboxListTile(
                value: thirtyDaysBefore,
                title: const Text('30 days before expiry date'),
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    thirtyDaysBefore = value ?? false;
                  });
                },
              ),
            DatePickerWidget(
              text: 'Reminder date',
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(kTwentyFiveYearDuration),
              onSelected: (value) {
                reminderDate = value;
                if (_buildReminderDates().isNotEmpty) {
                  setState(() {
                    dateValidationError = null;
                  });
                }
              },
              initialValue: reminderDate,
            ),
            if (dateValidationError != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dateValidationError!,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              ),
            AsyncValueWidget(
              value: ref.watch(listStaffProvider()),
              data: (staff) {
                return MultiSelectFormField<Staff>(
                  title: 'Recipients',
                  items: staff,
                  toCard: (value) {
                    return CheckListCard<Staff>(
                      value: value,
                      title: Text(value.fullName),
                    );
                  },
                  onChange: (newValue) {
                    selectedStaff = newValue;
                  },
                  initialValue: selectedStaff,
                );
              },
            ),
          ],
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
          onPressed: isSubmitting ? null : _createReminders,
          icon: const Icon(Icons.add_alert_outlined),
          label: const Text('Create reminder(s)'),
        ),
      ],
    );
  }
}
