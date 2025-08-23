part of 'internal_audit_report/route.dart';

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
        if (isIncluded == null) {
          notifier.updateDetails({'is_discrepancies_found': false});
          return false;
        }
        return isIncluded;
      }),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Were Any Discrepancies Found?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Radio(
                value: true,
                groupValue: isDiscrepanciesFound,
                onChanged: (value) {
                  if (isEditMode) {
                    notifier.updateDetailsTriggerWatch(
                        {'is_discrepancies_found': value});
                  }
                },
              ),
              const Text(
                'Yes',
              ),
              Radio(
                value: false,
                groupValue: isDiscrepanciesFound,
                onChanged: (value) {
                  if (isEditMode) {
                    notifier.updateDetailsTriggerWatch(
                        {'is_discrepancies_found': value});
                  }
                },
              ),
              const Text(
                'No',
              ),
            ],
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
        if (isIncluded == null) {
          notifier.updateDetails({'is_discrepancies_found': false});
          return false;
        }
        return isIncluded;
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
