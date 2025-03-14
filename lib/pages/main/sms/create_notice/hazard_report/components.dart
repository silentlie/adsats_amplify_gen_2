part of 'route.dart';

class MitigateCommentWidget extends ConsumerWidget {
  const MitigateCommentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    bool isIncludedComment = ref.watch(noticeNotifierProvider.select((value) {
      final isIncluded = value.details["included_comment"] as bool?;
      if (isIncluded == null) {
        details["included_comment"] = false;
        notifier.updateNotice(details: details);
        return false;
      }
      return isIncluded;
    }));
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
                groupValue: isIncludedComment,
                onChanged: (value) {
                  if (isEditMode) {
                    details['included_comment'] = value!;
                    notifier.updateDetails(details);
                  }
                },
              ),
              const Text(
                'Yes',
              ),
              Radio(
                value: false,
                groupValue: isIncludedComment,
                onChanged: (value) {
                  if (isEditMode) {
                    details['included_comment'] = value!;
                    notifier.updateDetails(details);
                  }
                },
              ),
              const Text(
                'No',
              ),
            ],
          ),
        ),
        if (isIncludedComment == true)
          GlobalTextFormField(
            labelText:
                'In your opinion, how could the hazard or event be mitigated?',
            onSaved: (value) {
              details["mitigation"] = value;
              notifier.updateNotice(details: details);
            },
            initialValue: details["mitigation"],
            enabled: isEditMode,
            minLines: 3,
          ),
      ],
    );
  }
}

class RiskWidget extends ConsumerWidget {
  const RiskWidget({super.key});

  final List<Map<String, dynamic>> likelihoodofOccurrence = const [
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
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    int likelihood = ref.watch(noticeNotifierProvider.select((value) {
      final likely = value.details["likelihood"] as int?;
      if (likely == null) {
        details["likelihood"] = 0;
        notifier.updateNotice(details: details);
        return 0;
      }
      return likely;
    }));
    int severity = ref.watch(noticeNotifierProvider.select((value) {
      final severe = value.details["severity"] as int?;
      if (severe == null) {
        details["severity"] = 0;
        notifier.updateNotice(details: details);
        return 0;
      }
      return severe;
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
                          selected: index == likelihood,
                          onSelectChanged: (value) {
                            if (isEditMode) {
                              details['likelihood'] = index;
                              notifier.updateDetails(details);
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
                              details['severity'] = index;
                              notifier.updateDetails(details);
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

  Color getRiskColor(int likelihood, int severity) {
    final risk = likelihood + severity;
    if (likelihood == 0 && likelihood == 3) {
      return Colors.green;
    } else if (risk < 3) {
      return Colors.green;
    } else if (risk < 6) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

  String getRiskText(int likelihood, int severity) {
    final risk = likelihood + severity;
    if (likelihood == 0 && severity == 3) {
      return "Acceptable";
    } else if (risk < 3) {
      return "Acceptable";
    } else if (risk < 6) {
      return "Review";
    } else {
      return "Unacceptable";
    }
  }
}

class SafetyOfficersSection extends ConsumerWidget {
  const SafetyOfficersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHidden = ref.watch(noticeNotifierProvider.select((value) {
      final status = value.notice.status!;
      return status == NoticeStatus.Draft || status == NoticeStatus.Open;
    }));
    if (isHidden) {
      return SizedBox();
    }
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    details.putIfAbsent(
      "isConfidential",
      () => false,
    );
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
              details["isConfidential"] = value!;
              notifier.updateNotice(details: details);
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
            details["interim_comment"] = value;
            notifier.updateNotice(details: details);
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
                  details["reviewedAt"] = value.toString();
                  notifier.updateNotice(details: details);
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
                  initialSelection: details["review_likelihood"] ?? 0,
                  expandedInsets: EdgeInsets.zero,
                  label: const Text("Reviewed likelihood"),
                  onSelected: (value) {
                    details["reviewed_likelihood"] = value;
                    notifier.updateNotice(details: details);
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
                  initialSelection: details["review_severity"] ?? 0,
                  expandedInsets: EdgeInsets.zero,
                  label: const Text("Reviewed severity"),
                  onSelected: (value) {
                    details["reviewed_severity"] = value;
                    notifier.updateNotice(details: details);
                  },
                ),
              ),
            ),
          ],
        ),
        GlobalTextFormField(
          labelText: "Additional comments",
          onSaved: (value) {
            details["additional_comment"] = value;
            notifier.updateNotice(details: details);
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
                  details["closedAt"] = value.toString();
                  notifier.updateNotice(details: details);
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
              child: AsyncValueWidget(
                value: ref.watch(listStaffProvider()),
                data: (value) {
                  return GlobalDropdownMenu(
                    entries: value.map(
                      (e) {
                        return DropdownMenuEntry(value: e, label: e.name);
                      },
                    ).toList(),
                    onSelected: (value) {
                      details["signature"] = value!;
                    },
                    enabled: isEditMode,
                    initialSelection: details["signature"] == null
                        ? null
                        : Staff.fromJson(details["signature"]),
                    text: "Safety officer closed this notice",
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
