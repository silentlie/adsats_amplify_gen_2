part of 'hazard_report_widget.dart';

class MitigateCommentWidget extends StatefulWidget {
  const MitigateCommentWidget({super.key});

  @override
  State<MitigateCommentWidget> createState() => _MitigateCommentWidgetState();
}

class _MitigateCommentWidgetState extends State<MitigateCommentWidget> {
  @override
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    noticeNotifier.details.putIfAbsent(
      "included_comment",
      () => false,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Include mitigation comment?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Radio(
                value: true,
                groupValue: noticeNotifier.details['included_comment'],
                onChanged: (value) {
                  if (noticeNotifier.editMode) {
                    setState(() {
                      noticeNotifier.details['included_comment'] = value!;
                    });
                  }
                },
              ),
              const Text(
                'Yes',
              ),
              Radio(
                value: false,
                groupValue: noticeNotifier.details['included_comment'],
                onChanged: (value) {
                  if (noticeNotifier.editMode) {
                    setState(() {
                      noticeNotifier.details['included_comment'] = value!;
                    });
                  }
                },
              ),
              const Text(
                'No',
              ),
            ],
          ),
        ),
        if (noticeNotifier.details['included_comment'] == true)
          GlobalTextFormField(
            labelText:
                'In your opinion, how could the hazard or event be mitigated?',
            onSaved: (value) {
              noticeNotifier.details["mitigation"] = value;
            },
            initialValue: noticeNotifier.details["mitigation"],
            enabled: noticeNotifier.editMode,
            minLines: 3,
          ),
      ],
    );
  }
}

class SafetyOfficersSection extends StatelessWidget {
  const SafetyOfficersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    if (noticeNotifier.status == NoticeStatus.Draft ||
        noticeNotifier.status == NoticeStatus.Open) {
      return SizedBox();
    }
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
        GlobalTextFormField(
          labelText: "Interim Action/Comment",
          onSaved: (value) {
            noticeNotifier.details["interim_comment"] = value;
          },
          initialValue: noticeNotifier.details["interim_comment"],
          enabled: noticeNotifier.editMode,
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
                  noticeNotifier.details["reviewedAt"] = value.toString();
                },
                enabled: noticeNotifier.editMode,
                initialValue: noticeNotifier.details["reviewedAt"] == null
                    ? null
                    : TemporalDateTime.fromString(
                        noticeNotifier.details["reviewedAt"]),
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
                  enabled: noticeNotifier.editMode,
                  requestFocusOnTap: false,
                  initialSelection:
                      noticeNotifier.details["review_likelihood"] ?? 0,
                  expandedInsets: EdgeInsets.zero,
                  label: const Text("Reviewed likelihood"),
                  onSelected: (value) {
                    noticeNotifier.details["reviewed_likelihood"] = value;
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
                  enabled: noticeNotifier.editMode,
                  requestFocusOnTap: false,
                  initialSelection:
                      noticeNotifier.details["review_severity"] ?? 0,
                  expandedInsets: EdgeInsets.zero,
                  label: const Text("Reviewed severity"),
                  onSelected: (value) {
                    noticeNotifier.details["reviewed_severity"] = value;
                  },
                ),
              ),
            ),
          ],
        ),
        GlobalTextFormField(
          labelText: "Additional comments",
          onSaved: (value) {
            noticeNotifier.details["additional_comment"] = value;
          },
          initialValue: noticeNotifier.details["additional_comment"],
          enabled: noticeNotifier.editMode,
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
                  noticeNotifier.details["closedAt"] = value.toString();
                },
                enabled: noticeNotifier.editMode,
                initialValue: noticeNotifier.details["closedAt"] == null
                    ? null
                    : TemporalDateTime.fromString(
                        noticeNotifier.details["closedAt"]),
              ),
            ),
            Flexible(
              child: FutrureDropdownMenu<Staff>(
                modelType: Staff.classType,
                toList: (allData) => allData
                    .map((e) => DropdownMenuEntry(value: e, label: e.name))
                    .toList(),
                onSelected: (value) {
                  noticeNotifier.author = value!;
                },
                enabled: noticeNotifier.editMode,
                initialSelection: noticeNotifier.details["signature"] == null
                    ? null
                    : Staff.fromJson(noticeNotifier.details["signature"]),
                text: "Safety officer closed this notice",
              ),
            ),
          ],
        )
      ],
    );
  }
}

class RiskWidget extends StatefulWidget {
  const RiskWidget({super.key});

  @override
  State<RiskWidget> createState() => _RiskWidgetState();
}

class _RiskWidgetState extends State<RiskWidget> {
  final List<Map<String, dynamic>> likelihoodofOccurrence = [
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
      "Definition": "Occassional",
      "Meaning": "Likely to occur sometimes",
      "value": "4"
    },
    {
      "Definition": "Frequent",
      "Meaning": "Likely to occur many time",
      "value": "5"
    },
  ];
  final List<Map<String, dynamic>> severityOfConsequence = [
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
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    noticeNotifier.details.putIfAbsent(
      "likelihood",
      () => 0,
    );
    noticeNotifier.details.putIfAbsent(
      "severity",
      () => 0,
    );
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
                    columns: likelihoodofOccurrence.first.keys.map(
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
                      likelihoodofOccurrence.length,
                      (index) {
                        Map<String, dynamic> row =
                            likelihoodofOccurrence[index];
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
                          selected:
                              index == noticeNotifier.details["likelihood"],
                          onSelectChanged: (value) {
                            if (noticeNotifier.editMode) {
                              setState(() {
                                noticeNotifier.details["likelihood"] = index;
                              });
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
                          selected: index == noticeNotifier.details["severity"],
                          onSelectChanged: (value) {
                            if (noticeNotifier.editMode) {
                              setState(() {
                                noticeNotifier.details["severity"] = index;
                              });
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
                      fillColor: noticeNotifier.getRiskColor(),
                      filled: true,
                      hintText: noticeNotifier.getRiskText()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
