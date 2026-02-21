import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'risk_mixin.dart';

class MitigateCommentWidget extends ConsumerWidget {
  const MitigateCommentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(
      noticeFormProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeFormProvider.select(
      (value) => value.details,
    ));
    bool isIncludedComment = ref.watch(noticeFormProvider.select((value) {
      final isIncluded = value.details["included_comment"] as bool?;
      return isIncluded ?? false;
    }));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioGroup<bool>(
            groupValue: isIncludedComment,
            onChanged: (value) {
              if (isEditMode) {
                notifier.updateDetails({'included_comment': value});
                notifier.commit();
              }
            },
            child: Row(
              children: [
                const Text(
                  'Include mitigation comment?',
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
        if (isIncludedComment)
          GlobalTextFormField(
            labelText:
                'In your opinion, how could the hazard or event be mitigated?',
            onSaved: (value) {
              notifier.updateDetails({"mitigation": value});
            },
            initialValue: details["mitigation"],
            enabled: isEditMode,
            minLines: 3,
          ),
      ],
    );
  }
}

class RiskWidget extends ConsumerWidget with RiskMixin {
  const RiskWidget({super.key});

  final List<Map<String, dynamic>> likelihoodOfOccurrence = const [
    {
      "Definition": "Extremely improbable",
      "Meaning": "Almost inconceivable that the event will occur",
      "value": "1"
    },
    {
      "Definition": "Improbable",
      "Meaning": "Very unlikely to occur",
      "value": "2"
    },
    {
      "Definition": "Remote",
      "Meaning": "Unlikely to occur but possible",
      "value": "3"
    },
    {
      "Definition": "Occasional",
      "Meaning": "Likely to occur sometimes",
      "value": "4"
    },
    {
      "Definition": "Frequent",
      "Meaning": "Likely to occur many time",
      "value": "5"
    },
  ];

  final List<Map<String, dynamic>> severityOfConsequence = const [
    {
      "Definition": "Negligible",
      "Meaning": "Nuisance of little consequences",
      "Value": "1"
    },
    {
      "Definition": "Minor",
      "Meaning": "Results in a minor incident",
      "Value": "2"
    },
    {
      "Definition": "Major",
      "Meaning": "Serious incident or injury",
      "Value": "3"
    },
    {
      "Definition": "Hazardous",
      "Meaning": "Serious injury or major equipment damage",
      "Value": "4"
    },
    {
      "Definition": "Catastrophic",
      "Meaning": "Results in an accident, death or equipment destroyed",
      "Value": "5"
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(
      noticeFormProvider.select(
        (value) => value.editMode,
      ),
    );
    int likelihood = ref.watch(noticeFormProvider.select((value) {
      final likely = value.details["likelihood"] as int?;
      return likely ?? 0;
    }));
    int severity = ref.watch(noticeFormProvider.select((value) {
      final severe = value.details["severity"] as int?;
      return severe ?? 0;
    }));
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'In your opinion, what is the likelihood of the occurrence happening again? Click on the table below.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataTable(
                    columns: likelihoodOfOccurrence.first.keys.map(
                      (column) {
                        return DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(column),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    rows: List.generate(
                      likelihoodOfOccurrence.length,
                      (index) {
                        Map<String, dynamic> row =
                            likelihoodOfOccurrence[index];
                        return DataRow(
                          cells: row.values.map(
                            (column) {
                              return DataCell(
                                Center(
                                  child: Text(
                                    column,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          selected: index == likelihood,
                          onSelectChanged: (value) {
                            if (isEditMode) {
                              notifier.updateDetails(
                                {"likelihood": index},
                              );
                              notifier.commit();
                            }
                          },
                          color: WidgetStateColor.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.lightBlue;
                              } else {
                                return Colors.transparent;
                              }
                            },
                          ),
                        );
                      },
                    ),
                    showCheckboxColumn: false,
                    border: TableBorder.all(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'What do you consider to be the worst possible consequence of this event happening? Click on the table below.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataTable(
                    columns: severityOfConsequence.first.keys.map(
                      (column) {
                        return DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(column),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    rows: List.generate(
                      severityOfConsequence.length,
                      (index) {
                        Map<String, dynamic> row = severityOfConsequence[index];
                        return DataRow(
                          cells: row.values.map(
                            (column) {
                              return DataCell(
                                Center(
                                  child: Text(
                                    column,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          selected: index == severity,
                          onSelectChanged: (value) {
                            if (isEditMode) {
                              notifier.updateDetails(
                                {"severity": index},
                              );
                              notifier.commit();
                            }
                          },
                          color: WidgetStateColor.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.lightBlue;
                              } else {
                                return Colors.transparent;
                              }
                            },
                          ),
                        );
                      },
                    ),
                    showCheckboxColumn: false,
                    border: TableBorder.all(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Risk Severity:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.info_outline,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Image.asset('risk-severity-chart.png'),
                    ),
                  );
                },
              ),
              IntrinsicWidth(
                child: GlobalTextFormField(
                  labelText: "Risk",
                  onSaved: (value) {},
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: getRiskColor(likelihood, severity),
                    filled: true,
                    hintText: getRiskText(likelihood, severity),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SafetyOfficersSection extends ConsumerWidget {
  const SafetyOfficersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHidden = ref.watch(noticeFormProvider.select((value) {
      final status = value.notice.status!;
      return status == NoticeStatus.Draft || status == NoticeStatus.Open;
    }));
    if (isHidden) {
      return SizedBox();
    }
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(
      noticeFormProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeFormProvider.select(
      (value) => value.details,
    ));
    if (!details.containsKey("isConfidential")) {
      notifier.updateDetails({"isConfidential": false});
    }
    final recipients = ref.read(noticeFormProvider.select(
      (value) => value.recipients,
    ));
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'This section to be completed by the safety officers',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: DropdownMenu(
            dropdownMenuEntries: [
              DropdownMenuEntry(value: false, label: "Open"),
              DropdownMenuEntry(value: true, label: "Confidential"),
            ],
            enabled: isEditMode,
            onSelected: (value) {
              notifier.updateDetails({"isConfidential": value});
            },
            hintText: "Is this report confidential?",
            expandedInsets: EdgeInsets.zero,
            initialSelection: details["isConfidential"],
            label: Text("Is this report confidential?"),
          ),
        ),
        GlobalTextFormField(
          labelText: "Interim Action/Comment",
          onSaved: (value) {
            notifier.updateDetails({"interim_comment": value});
          },
          initialValue: details["interim_comment"],
          enabled: isEditMode,
          maxLines: 3,
        ),
        Row(
          children: [
            Flexible(
              child: DatePickerWidget(
                text: "SRB Review Date",
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365 * 10),
                ),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 10),
                ),
                onSelected: (value) {
                  notifier.updateDetails({"reviewedAt": value});
                },
                enabled: isEditMode,
                initialValue: details["reviewedAt"] == null
                    ? null
                    : TemporalDateTime.fromString(
                        details["reviewedAt"],
                      ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: List<DropdownMenuEntry>.generate(
                    5,
                    (int index) {
                      return DropdownMenuEntry(
                        label: (index + 1).toString(),
                        value: index,
                      );
                    },
                  ),
                  enabled: isEditMode,
                  requestFocusOnTap: false,
                  initialSelection: details["reviewed_likelihood"] ?? 0,
                  expandedInsets: EdgeInsets.zero,
                  label: const Text("Reviewed likelihood"),
                  onSelected: (value) {
                    notifier.updateDetails({"reviewed_likelihood": value});
                  },
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: List<DropdownMenuEntry>.generate(
                    5,
                    (int index) {
                      return DropdownMenuEntry(
                        label: (index + 1).toString(),
                        value: index,
                      );
                    },
                  ),
                  enabled: isEditMode,
                  requestFocusOnTap: false,
                  initialSelection: details["reviewed_severity"] ?? 0,
                  expandedInsets: EdgeInsets.zero,
                  label: const Text("Reviewed severity"),
                  onSelected: (value) {
                    notifier.updateDetails({"reviewed_severity": value});
                  },
                ),
              ),
            ),
          ],
        ),
        GlobalTextFormField(
          labelText: "Additional comments",
          onSaved: (value) {
            notifier.updateDetails({"additional_comment": value});
          },
          initialValue: details["additional_comment"],
          enabled: isEditMode,
          maxLines: 3,
        ),
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
                  notifier.updateDetails({"closedAt": value});
                },
                enabled: isEditMode,
                initialValue: details["closedAt"] == null
                    ? null
                    : TemporalDateTime.fromString(
                        details["closedAt"],
                      ),
              ),
            ),
            Flexible(
              child: GlobalDropdownMenu(
                entries: recipients.map(
                  (e) {
                    return DropdownMenuEntry(
                        value: e, label: e.staff!.fullName);
                  },
                ).toList(),
                onSelected: (value) {
                  notifier.updateDetails({"signature": value});
                },
                enabled: isEditMode,
                initialSelection: details["signature"] == null
                    ? null
                    : Staff.fromJson(details["signature"]),
                text: "Safety officer closed this notice",
              ),
            ),
          ],
        )
      ],
    );
  }
}
