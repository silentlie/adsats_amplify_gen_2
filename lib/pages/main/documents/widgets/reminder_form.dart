import 'package:adsats_amplify_gen_2/constants/durations.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/models/reminder.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderForm extends ConsumerWidget {
  const ReminderForm({
    super.key,
    required this.state,
    required this.onChanged,
  });

  final ReminderFormState state;
  final ValueChanged<ReminderFormState> onChanged;

  void _update(ReminderFormState next) {
    if (state.dateValidationError != null) {
      onChanged(next.validate());
      return;
    }

    onChanged(next);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (state.expiredAt != null && state.isOffsetDateAvailable(90))
          CheckboxListTile(
            value: state.ninetyDaysBefore,
            title: const Text('90 days before expiry date'),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              _update(
                state.copyWith(ninetyDaysBefore: value ?? false),
              );
            },
          ),
        if (state.expiredAt != null && state.isOffsetDateAvailable(60))
          CheckboxListTile(
            value: state.sixtyDaysBefore,
            title: const Text('60 days before expiry date'),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              _update(
                state.copyWith(sixtyDaysBefore: value ?? false),
              );
            },
          ),
        if (state.expiredAt != null && state.isOffsetDateAvailable(30))
          CheckboxListTile(
            value: state.thirtyDaysBefore,
            title: const Text('30 days before expiry date'),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              _update(
                state.copyWith(thirtyDaysBefore: value ?? false),
              );
            },
          ),
        DatePickerWidget(
          text: 'Reminder date',
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(kTwentyFiveYearDuration),
          onSelected: (value) {
            _update(state.copyWith(reminderDate: value));
          },
          initialValue: state.reminderDate,
        ),
        if (state.dateValidationError != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.dateValidationError!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
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
                _update(state.copyWith(selectedStaff: newValue));
              },
              initialValue: state.selectedStaff,
            );
          },
        ),
      ],
    );
  }
}
