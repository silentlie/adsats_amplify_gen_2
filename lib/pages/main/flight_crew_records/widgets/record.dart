import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/records.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/service.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditFlightCrewRecordView extends ConsumerWidget with ConfirmDialogMixin {
  const EditFlightCrewRecordView({super.key, required this.record});

  final FlightCrewRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    FlightCrewRecord record = this.record;
    return AlertDialog.adaptive(
      title: Text(
        'Edit Record: ${record.name}',
        style: themeData.textTheme.headlineMedium,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlobalTextFormField(
              labelText: "Document name",
              onSaved: (value) {
                record = record.copyWith(name: value);
              },
              onChanged: (value) {
                record = record.copyWith(name: value);
              },
              initialValue: record.name,
              isFileName: true,
            ),
            GlobalDropdownMenu(
              entries: const [
                DropdownMenuEntry(value: true, label: "No"),
                DropdownMenuEntry(value: true, label: "Yes"),
                DropdownMenuEntry(value: null, label: "All"),
              ],
              onSelected: (value) {
                record = record.copyWith(archived: value);
              },
              initialSelection: record.archived,
              text: "Archived",
            ),
            DatePickerWidget(
              text: "Issue Date",
              firstDate: DateTime.now().subtract(
                const Duration(days: 365 * 10),
              ),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
              onSelected: (value) {
                record = record.copyWith(issuedAt: value);
              },
              initialValue: record.issuedAt,
            ),
            DatePickerWidget(
              text: "Expired date",
              firstDate: DateTime.now().subtract(
                const Duration(days: 365 * 10),
              ),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
              onSelected: (value) {
                record = record.copyWith(expiredAt: value);
              },
              initialValue: record.expiredAt,
            ),
          ],
        ),
      ),
      actions: [
        // cancel
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to cancel?"),
            );
            if (!result) {
              return;
            }
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              FlightCrewRecordsRoute().go(context);
            }
          },
          label: const Text('Cancel'),
          icon: Icon(Icons.cancel_outlined),
        ),
        // apply
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to apply these changes?"),
            );
            if (!result) {
              return;
            }
            final service = ref.read(recordsServiceProvider);
            if (this.record.name != record.name) {
              await service.rename(this.record, record);
            }
            await service.update(record);
            ref.invalidate(recordsProvider);
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              DocumentsRoute().go(context);
            }
          },
          style: ButtonStyle(
            // Change button background color
            backgroundColor:
                WidgetStateProperty.all<Color>(colorScheme.secondary),
          ),
          label: Text(
            'Apply changes',
            style: TextStyle(color: colorScheme.onSecondary),
          ),
          icon: Icon(
            Icons.upload_file,
            color: colorScheme.onSecondary,
          ),
        )
      ],
    );
  }
}
