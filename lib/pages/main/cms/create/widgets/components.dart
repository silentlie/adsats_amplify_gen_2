import 'package:adsats_amplify_gen_2/constants/durations.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/form.dart';
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
    final notifier = ref.read(reportFormProvider.notifier);
    final isEditMode = ref.watch(
      reportFormProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(reportFormProvider.select(
      (value) => value.details,
    ));
    bool isDiscrepanciesFound = ref.watch(
      reportFormProvider.select(
        (value) => value.report.discrepanciesFound,
      ),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioGroup<bool>(
            groupValue: isDiscrepanciesFound,
            onChanged: (value) {
              if (isEditMode) {
                notifier.updateReport(discrepanciesFound: value);
                notifier.commit();
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
    final report = ref.read(reportFormProvider).report;
    final notifier = ref.read(reportFormProvider.notifier);
    final isEditMode = ref.watch(
      reportFormProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(reportFormProvider.select(
      (value) => value.details,
    ));
    bool isDiscrepanciesFound = ref.watch(
      reportFormProvider.select(
        (value) => value.report.discrepanciesFound,
      ),
    );
    final isClosed = ref.watch(
      reportFormProvider.select(
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
                  firstDate: DateTime.now().subtract(kTwentyFiveYearDuration),
                  lastDate: DateTime.now().add(kTwentyFiveYearDuration),
                  onSelected: (value) {
                    notifier.updateReport(closeDate: value);
                  },
                  enabled: isEditMode,
                  initialValue: report.closeAt,
                ),
              ),
              Flexible(
                child: AsyncValueWidget(
                  // TODO: filter only compliance managers
                  value: ref.watch(listStaffProvider()),
                  data: (value) {
                    return GlobalDropdownMenu(
                      entries: value.map(
                        (e) {
                          return DropdownMenuEntry(value: e, label: e.fullName);
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
