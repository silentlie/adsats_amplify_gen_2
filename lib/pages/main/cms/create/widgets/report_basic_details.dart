import 'package:adsats_amplify_gen_2/constants/durations.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/form.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportBasicDetails extends ConsumerWidget {
  const ReportBasicDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.read(reportFormProvider).report;
    final isComplianceManager = ref.watch(isComplianceManagerProvider);
    final notifier = ref.read(reportFormProvider.notifier);
    final isEditMode = ref.watch(reportFormProvider.select(
      (value) => value.editMode,
    ));
    final status = ref.watch(reportFormProvider.select(
      (value) => value.report.status,
    ));
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            Expanded(
              child: GlobalTextFormField(
                labelText: 'Report ID',
                enabled: false,
                initialValue: report.id,
                onSaved: (value) {},
              ),
            ),
            Expanded(
              child: AsyncValueWidget(
                value: ref.watch(listStaffProvider()),
                data: (value) {
                  final initialSelection = notifier.isNew()
                      ? value.firstWhere((e) => e.id == report.auditor?.id)
                      : report.auditor!;
                  notifier.updateReport(
                    auditor: initialSelection,
                  );
                  return GlobalDropdownMenu<Staff>(
                    entries: value.map(
                      (e) {
                        return DropdownMenuEntry(value: e, label: e.fullName);
                      },
                    ).toList(),
                    enabled: isComplianceManager && isEditMode,
                    initialSelection: initialSelection,
                    onSelected: (value) {
                      notifier.updateReport(auditor: value);
                    },
                    text: "Auditor of this report",
                  );
                },
              ),
            ),
          ],
        ),
        DatePickerWidget(
          text: "Report Date",
          onSelected: (value) {
            notifier.updateReport(reportDate: value);
          },
          enabled: isEditMode,
          initialValue: report.reportedAt,
          firstDate: DateTime.now().subtract(kTwentyFiveYearDuration),
          lastDate: DateTime.now(),
        ),
        Row(
          children: [
            Expanded(
              child: GlobalTextFormField(
                labelText: "Subject",
                onSaved: (value) {
                  notifier.updateReport(subject: value);
                },
                initialValue: report.subject,
                enabled: isEditMode,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: ReportStatus.values
                      .where(
                        (element) {
                          if (element != ReportStatus.Closed) {
                            return true;
                          }
                          return isComplianceManager;
                        },
                      )
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList(),
                  initialSelection: status,
                  enabled: isEditMode,
                  onSelected: (value) {
                    notifier.switchStatus(value!);
                  },
                  hintText: "Status of this notice",
                  menuHeight: 200,
                  expandedInsets: EdgeInsets.zero,
                  label: Text("Status of this notice"),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ],
    );
  }
}
