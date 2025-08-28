import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/state.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscrepanciesWidget extends ConsumerWidget {
  const DiscrepanciesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(reportNotifierProvider.notifier);
    final isEditMode = ref.watch(
      reportNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(reportNotifierProvider.select(
      (value) => value.details,
    ));
    bool isDiscrepanciesFound = ref.watch(
      reportNotifierProvider.select((value) {
        final isIncluded = value.details["is_discrepancies_found"] as bool?;
        return isIncluded ?? false;
      }),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioGroup<bool>(
            groupValue: isDiscrepanciesFound,
            onChanged: (value) {
              if (isEditMode) {
                notifier.updateDetailsTriggerWatch(
                    {'is_discrepancies_found': value});
              }
            },
            child: Row(
              children: [
                const Text(
                  'Were Any Discrepancies Found?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Radio<bool>(value: true),
                const Text('Yes'),
                Radio<bool>(value: false),
                const Text('No'),
              ],
            ),
          ),
        ),
        if (isDiscrepanciesFound)
          GlobalTextFormField(
            labelText: 'Discrepancies',
            onSaved: (value) {
              notifier.updateDetails({'discrepancies': value});
            },
            initialValue: details["discrepancies"],
            enabled: isEditMode,
            minLines: 3,
          ),
        if (isDiscrepanciesFound)
          GlobalTextFormField(
            labelText: "Pending Comment",
            onSaved: (value) {
              notifier.updateDetails({'pending_comment': value});
            },
            initialValue: details["pending_comment"],
            enabled: isEditMode,
            maxLines: 3,
            validator: (string) {
              return null;
            },
          ),
        if (!isDiscrepanciesFound)
          GlobalTextFormField(
            labelText: 'Comments',
            onSaved: (value) {
              notifier.updateDetails({'comments': value});
            },
            initialValue: details["comments"],
            enabled: isEditMode,
            minLines: 3,
          ),
      ],
    );
  }
}

class ComplianceManagerSection extends ConsumerWidget {
  const ComplianceManagerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.read(reportNotifierProvider).report;
    final notifier = ref.read(reportNotifierProvider.notifier);
    final isEditMode = ref.watch(
      reportNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(reportNotifierProvider.select(
      (value) => value.details,
    ));
    bool isDiscrepanciesFound = ref.watch(
      reportNotifierProvider.select((value) {
        final isIncluded = value.details["is_discrepancies_found"] as bool?;
        return isIncluded ?? false;
      }),
    );
    final isClosed = ref.watch(
      reportNotifierProvider.select(
        (value) => value.report.status == ReportStatus.Closed,
      ),
    );
    return Column(
      children: [
        const Divider(),
        Text(
          "Compliance Manager Section",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        if (isDiscrepanciesFound)
          GlobalTextFormField(
            labelText: "Corrective Action",
            onSaved: (value) {
              notifier.updateDetails({'corrective_action': value});
            },
            initialValue: details["corrective_action"],
            enabled: isEditMode,
            maxLines: 3,
          ),
        if (isClosed)
          Row(
            children: [
              Flexible(
                child: DatePickerWidget(
                  text: "Closed date",
                  firstDate: DateTime.now().subtract(
                    const Duration(days: 365 * 10),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                  onSelected: (value) {
                    notifier.updateReport(closeAt: value);
                  },
                  enabled: isEditMode,
                  initialValue: report.closeAt,
                ),
              ),
              Flexible(
                child: AsyncValueWidget(
                  value: ref.watch(listStaffProvider()),
                  data: (value) {
                    return GlobalDropdownMenu(
                      entries: value.map(
                        (e) {
                          return DropdownMenuEntry(
                              value: e, label: "${e.firstName} ${e.lastName}");
                        },
                      ).toList(),
                      onSelected: (value) {
                        notifier.updateReport(closer: value);
                      },
                      enabled: isEditMode,
                      initialSelection: report.closer,
                      text: "Compliance Manager",
                    );
                  },
                ),
              ),
            ],
          )
      ],
    );
  }
}
