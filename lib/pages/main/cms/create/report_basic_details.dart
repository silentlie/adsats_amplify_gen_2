import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/state.dart';
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
    final report = ref.read(reportNotifierProvider).report;
    final isComplianceManager = ref.watch(isComplianceManagerProvider);
    final notifier = ref.read(reportNotifierProvider.notifier);
    final isEditMode = ref.watch(reportNotifierProvider.select(
      (value) => value.editMode,
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
                  final initialSelection = !notifier.isEditable()
                      ? value.firstWhere(
                          (e) =>
                              e.id ==
                              ref.watch(userDetailsProvider).value!.id,
                        )
                      : report.auditor!;
                  notifier.updateReport(
                    auditor: initialSelection,
                  );
                  return GlobalDropdownMenu<Staff>(
                    entries: value.map(
                      (e) {
                        return DropdownMenuEntry(
                            value: e, label: "${e.firstName} ${e.lastName}");
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
            notifier.updateReport(reportedAt: value);
          },
          enabled: isEditMode,
          initialValue: report.reportedAt,
          firstDate: DateTime.now().subtract(
            const Duration(days: 365 * 10),
          ),
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
                  initialSelection: ref.watch(reportNotifierProvider.select(
                    (value) => value.report.status,
                  )),
                  enabled: isEditMode,
                  onSelected: (value) {
                    notifier.updateStatus(value!);
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
