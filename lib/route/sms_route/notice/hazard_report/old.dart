import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/future_multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class HazardReportWidget extends StatefulWidget {
  const HazardReportWidget({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  State<HazardReportWidget> createState() => _HazardReportWidgetState();
}

class _HazardReportWidgetState extends State<HazardReportWidget> {
  final formKey = GlobalKey<FormState>();
  late bool editMode;
  late Notice notice;
  late List<Aircraft> aircraft;
  late List<Staff> recipients;
  late Map<String, dynamic> details;

  @override
  void initState() {
    editMode = widget.notice == null;
    notice = widget.notice ??
        Notice(
          subject: "",
          archived: false,
          details: "{}",
          aircraft: [],
          documents: [],
          recipients: [],
          status: NoticeStatus.Draft,
          type: NoticeType.Safety_notice,
        );
    aircraft = notice.aircraft!.map((e) => e.aircraft!).toList();
    recipients = [];
    // recipients = notice.recipients!.map((e) => e.staff!).toList();
    details = json.decode(notice.details);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    if (notice.author == null) {
      notice = notice.copyWith(author: authNotifier.user);
    }
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Hazard report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: GlobalTextFormField(
                    labelText: 'Notice ID',
                    enabled: false,
                    initialValue: notice.id,
                    onSaved: (value) {},
                  ),
                ),
                Expanded(
                  child: FutrureDropdownMenu<Staff>(
                    modelType: Staff.classType,
                    toList: (allData) => allData
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList(),
                    onSelected: (value) {
                      notice = notice.copyWith(author: value);
                    },
                    enabled: editMode,
                    initialSelection: notice.author,
                    text: "Author of this notice",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: DatePickerWidget(
                    text: "Notice Date",
                    onSelected: (value) {
                      notice = notice.copyWith(noticed_at: value);
                    },
                    enabled: editMode,
                    initialValue: notice.noticed_at,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate: DateTime.now(),
                  ),
                ),
                Expanded(
                  child: DatePickerWidget(
                    text: "Deadline Date",
                    onSelected: (value) {
                      notice = notice.copyWith(deadline_at: value);
                    },
                    enabled: editMode,
                    initialValue: notice.deadline_at,
                    firstDate: DateTime.now(),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GlobalTextFormField(
                    labelText: "Subject",
                    onSaved: (value) {
                      notice = notice.copyWith(subject: value);
                    },
                    initialValue: notice.subject,
                    enabled: editMode,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownMenu(
                      dropdownMenuEntries: NoticeStatus.values
                          .map(
                              (e) => DropdownMenuEntry(value: e, label: e.name))
                          .toList(),
                      initialSelection: notice.status,
                      enabled: editMode,
                      onSelected: (value) {
                        notice = notice.copyWith(status: value);
                        setState(() {});
                      },
                      hintText: "Status of this notice",
                      menuHeight: 200,
                      expandedInsets: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: GlobalTextFormField(
                    labelText: "Location",
                    onSaved: (value) {
                      details["location"] = value;
                    },
                    initialValue: details["location"],
                    enabled: editMode,
                  ),
                ),
                Expanded(
                  child: DropdownMenu(
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: false, label: "Open"),
                      DropdownMenuEntry(value: true, label: "Confidential"),
                    ],
                    enabled: editMode,
                    initialSelection: false,
                    onSelected: (value) => details["isConfidential"] = value!,
                  ),
                ),
              ],
            ),
            GlobalTextFormField(
              labelText: "Describe the Hazard or the Event",
              onSaved: (value) {
                details["description"] = value;
              },
              initialValue: details["description"],
              enabled: editMode,
              minLines: 5,
            ),
            const Divider(),
            const ComponentWidget(),
            // Wrap(
            //   alignment: WrapAlignment.center,
            //   crossAxisAlignment: WrapCrossAlignment.center,
            //   children: [
            //     Column(
            //       children: [
            //         Container(
            //           padding: const EdgeInsets.all(8),
            //           child: const Text(
            //             'What do you consider to be the worst possible consequence of this event happening? Click on the table below.',
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         DataTable(
            //           columns: severityOfConsequence.first.keys.map(
            //             (column) {
            //               return DataColumn(
            //                 label: Align(
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     column,
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //                 onSort: null,
            //               );
            //             },
            //           ).toList(),
            //           rows: List.generate(
            //             severityOfConsequence.length,
            //             (index) {
            //               Map<String, dynamic> row =
            //                   severityOfConsequence[index];
            //               return DataRow(
            //                 cells: row.values.map(
            //                   (column) {
            //                     return DataCell(
            //                       Center(
            //                         child: Text(
            //                           column,
            //                           textAlign: TextAlign.center,
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ).toList(),
            //                 // TODO:
            //                 selected: index == 0,
            //                 onSelectChanged: (value) {
            //                   if (true) {
            //                     setState(() {
            //                       index;
            //                     });
            //                   }
            //                 },
            //                 color: WidgetStateColor.resolveWith(
            //                   (states) {
            //                     if (states.contains(WidgetState.selected)) {
            //                       return Colors.lightBlue;
            //                     } else {
            //                       return Colors.transparent;
            //                     }
            //                   },
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Container(
            //           padding: const EdgeInsets.all(8),
            //           child: const Text(
            //             'In your opinion, what is the likelihood of the occurrence happening again? Click on the table below.',
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         DataTable(
            //           columns: likelihoodofOccurrence.first.keys.map(
            //             (column) {
            //               return DataColumn(
            //                 label: Align(
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     column,
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //                 onSort: null,
            //               );
            //             },
            //           ).toList(),
            //           rows: List.generate(
            //             likelihoodofOccurrence.length,
            //             (index) {
            //               Map<String, dynamic> row =
            //                   likelihoodofOccurrence[index];
            //               return DataRow(
            //                 cells: row.values.map(
            //                   (column) {
            //                     return DataCell(
            //                       Center(
            //                         child: Text(
            //                           column,
            //                           textAlign: TextAlign.center,
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ).toList(),
            //                 // TODO:
            //                 selected: index == 0,
            //                 onSelectChanged: (value) {
            //                   if (true) {
            //                     setState(() {
            //                       index;
            //                     });
            //                   }
            //                 },
            //                 color: WidgetStateColor.resolveWith(
            //                   (states) {
            //                     if (states.contains(WidgetState.selected)) {
            //                       return Colors.lightBlue;
            //                     } else {
            //                       return Colors.transparent;
            //                     }
            //                   },
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         const Text(
            //           "Risk Severity:",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         IconButton(
            //           icon: const Icon(
            //             Icons.info_outline,
            //           ),
            //           onPressed: () {
            //             showDialog(
            //               context: context,
            //               builder: (context) => AlertDialog(
            //                 content: Image.asset('risk-severity-chart.png'),
            //               ),
            //             );
            //           },
            //         ),
            //         GlobalTextFormField(
            //           //TODO
            //           labelText: "Risk Severity",
            //           onSaved: (value) {},
            //           enabled: true,
            //           readOnly: true,
            //           decoration: const InputDecoration(
            //               border: OutlineInputBorder(),
            //               fillColor: Colors.amber,
            //               filled: true,
            //               labelText: "Risk Severity"),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     GlobalTextFormField(
            //       labelText: "Interim Comment",
            //       onSaved: (value) {
            //         details["interim_comment"] = value;
            //       },
            //       initialValue: details["interim_comment"],
            //       enabled: editMode,
            //     ),
            //     DatePickerWidget(
            //       text: "Review Date",
            //       firstDate: DateTime.now().subtract(
            //         const Duration(days: 365 * 10),
            //       ),
            //       lastDate: DateTime.now().add(
            //         const Duration(days: 365 * 10),
            //       ),
            //       onSelected: (value) {
            //         details["reviewed_at"] = value;
            //       },
            //       enabled: editMode,
            //       initialValue: details["reviewed_at"],
            //     ),
            //   ],
            // ),
            // GlobalTextFormField(
            //   labelText: "Reason why it is not resolved",
            //   onSaved: (value) {
            //     details["pending_comments"] = value;
            //   },
            //   initialValue: details["pending_comments"],
            //   enabled: editMode,
            //   minLines: 3,
            //   maxLines: 6,
            // ),
            // Row(
            //   children: [
            //     Flexible(
            //       child: DropdownMenu(
            //         dropdownMenuEntries: List<DropdownMenuEntry>.generate(
            //           5,
            //           (int index) {
            //             return DropdownMenuEntry(
            //                 label: index.toString(), value: index);
            //           },
            //         ),
            //         enabled: editMode,
            //         requestFocusOnTap: false,
            //         initialSelection: details["review_likelihood"] ?? 0,
            //         expandedInsets: EdgeInsets.zero,
            //         label: const Text("Reviewed likelihood"),
            //         onSelected: (value) {
            //           details["review_likelihood"] = value;
            //         },
            //       ),
            //     ),
            //     Flexible(
            //       child: DropdownMenu(
            //         dropdownMenuEntries: List<DropdownMenuEntry>.generate(
            //           5,
            //           (int index) {
            //             return DropdownMenuEntry(
            //                 label: index.toString(), value: index);
            //           },
            //         ),
            //         enabled: editMode,
            //         requestFocusOnTap: false,
            //         initialSelection: details["review_severity"] ?? 0,
            //         expandedInsets: EdgeInsets.zero,
            //         label: const Text("Reviewed severity"),
            //         onSelected: (value) {
            //           details["review_severity"] = value;
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // GlobalTextFormField(
            //   labelText: "Additional comments",
            //   onSaved: (value) {
            //     details["additional_comments"] = value;
            //   },
            //   initialValue: details["additional_comments"],
            //   enabled: editMode,
            // ),
            const Divider(),
            Row(
              children: [
                if (editMode)
                  Expanded(
                    child: FutureMultiSelect<Aircraft>(
                      modelType: Aircraft.classType,
                      items: (allData) {
                        return allData
                            .map((e) => MultiSelectItem(e, e.name))
                            .toList();
                      },
                      onSelected: (options) {
                        aircraft = options.cast<Aircraft>();
                      },
                      initialSelection: aircraft,
                      text: "Aircraft",
                      title: const Text("Add aircraft"),
                      enabled: editMode,
                    ),
                  ),
                if (!editMode)
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Aircraft:"),
                        ...aircraft.map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(label: Text(e.name)),
                            ))
                      ],
                    ),
                  )),
                if (editMode && notice.status != NoticeStatus.Resolved)
                  Expanded(
                    child: Center(
                      child:
                          Text("This notice will be sent to Safety officers"),
                    ),
                  ),
                if (editMode && notice.status == NoticeStatus.Resolved)
                  Expanded(
                    child: FutureMultiSelect<Staff>(
                      modelType: Staff.classType,
                      items: (allData) {
                        return allData
                            .map((e) => MultiSelectItem(e, e.name))
                            .toList();
                      },
                      onSelected: (options) {
                        recipients = options.cast<Staff>();
                      },
                      initialSelection: recipients,
                      text: "Recipients",
                      title: const Text("Add recipients"),
                      enabled: editMode,
                    ),
                  ),
                if (!editMode)
                  Expanded(
                    child: Row(
                      children: [
                        Text("Recipients:"),
                        ...notice.recipients!.map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(label: Text(e.staff!.name)),
                            )),
                        if (notice.recipients!.isEmpty) Text("None"),
                      ],
                    ),
                  ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: actionsRow(context, authNotifier),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionsRow(BuildContext context, AuthNotifier authNotifier) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            context.go('/sms');
          },
          label: const Text('Cancel'),
        ),
        const SizedBox(width: 10),
        if (widget.notice != null) readButton(context, authNotifier, notice),
        const SizedBox(width: 10),
        if (widget.notice != null &&
            (authNotifier.isAdmin || authNotifier.isSafetyOfficer))
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                editMode = !editMode;
              });
            },
            label: editMode ? const Text('View Mode') : const Text('Edit Mode'),
          ),
        const SizedBox(width: 10),
        if (editMode)
          ElevatedButton.icon(
            onPressed: () async {
              await saveNotice(context, authNotifier, false);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                colorScheme.secondary,
              ),
            ),
            label:
                Text('Save', style: TextStyle(color: colorScheme.onSecondary)),
            icon: Icon(Icons.mail, color: colorScheme.onSecondary),
          ),
        const SizedBox(width: 10),
        if (editMode)
          ElevatedButton.icon(
            onPressed: () async {
              await saveNotice(context, authNotifier, true);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                colorScheme.secondary,
              ),
            ),
            label: Text(
              'Submit and Send',
              style: TextStyle(color: colorScheme.onSecondary),
            ),
            icon: Icon(
              Icons.mail,
              color: colorScheme.onSecondary,
            ),
          ),
      ],
    );
  }

  Widget readButton(
    BuildContext context,
    AuthNotifier authNotifier,
    Notice notice,
  ) {
    return FutureBuilder(
      future: list(
        NoticeStaff.classType,
        where: NoticeStaff.STAFF
            .eq(authNotifier.user.id)
            .and(NoticeStaff.NOTICE.eq(notice.id)),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final unreadList = snapshot.data!
              .where((element) => element.read_at == null)
              .toList();
          if (unreadList.isEmpty) {
            return ElevatedButton.icon(
              onPressed: () {},
              label: const Text('You\'ve read this notice'),
              icon: Icon(Icons.mark_email_read_outlined),
            );
          } else {
            return ElevatedButton.icon(
              onPressed: () async {
                await Future.wait(unreadList.map(
                  (e) => update(e.copyWith(read_at: TemporalDateTime.now())),
                ));
                if (!context.mounted) return;
                context.go('/sms');
              },
              label: const Text('Mark as read'),
              icon: Icon(Icons.mark_email_unread_outlined),
            );
          }
        }
      },
    );
  }

  Future<void> saveNotice(
      BuildContext context, AuthNotifier authNotifier, bool sendNotice) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      notice = notice.copyWith(details: json.encode(details));
      notice = notice.copyWith(details: json.encode(details));
      if (widget.notice == null) {
        await Future.wait([
          create(notice),
          ...aircraft.map(
            (e) => create(
              AircraftNotice(
                aircraft: e,
                notice: notice,
              ),
            ),
          )
        ]);
      } else {
        await Future.wait([
          update(notice),
          updateAircraftNotice(notice, aircraft),
        ]);
      }
      if (sendNotice) {
        await Future.wait(recipients.map(
          (e) => create(NoticeStaff(staff: e, notice: notice)),
        ));
      }
      if (!context.mounted) return;
      context.go('/sms');
    }
  }
}

class ComponentWidget extends StatefulWidget {
  const ComponentWidget({super.key});

  @override
  State<ComponentWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> details = {};
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Include mitigation comment?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Radio(
              value: true,
              groupValue: details['included_comment'],
              onChanged: (value) {
                if (true) {
                  setState(() {
                    details['included_comment'] = value!;
                  });
                }
              },
            ),
            const Text(
              'Yes',
            ),
            Radio(
              value: false,
              groupValue: details['included_comment'],
              onChanged: (value) {
                if (true) {
                  setState(() {
                    details['included_comment'] = value!;
                  });
                }
              },
            ),
            const Text(
              'No',
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Type of report:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Radio(
              value: true,
              groupValue: details['report_type'],
              onChanged: (value) {
                if (true) {
                  setState(() {
                    details['report_type'] = value!;
                  });
                }
              },
            ),
            const Text(
              'Open',
            ),
            Radio(
              value: false,
              groupValue: details['report_type'],
              onChanged: (value) {
                if (true) {
                  setState(() {
                    details['report_type'] = value!;
                  });
                }
              },
            ),
            const Text(
              'Confidential',
            ),
          ],
        ),
        GlobalTextFormField(
          labelText:
              'In your opinion, how could the hazard or event be mitigated?',
          onSaved: (value) {
            details["mitigation"] = value;
          },
          initialValue: details["mitigation"],
          enabled: true,
          minLines: 3,
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> severityOfConsequence = [
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
List<Map<String, dynamic>> likelihoodofOccurrence = [
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

class RiskSeverity extends ChangeNotifier {
  Map<String, dynamic> likelihoodAndSeverity = {};
  int getSelectedLikelihood() => likelihoodAndSeverity['likelihood'] ?? -1;
  int getSelectedSeverity() => likelihoodAndSeverity['severity'] ?? -1;
  void setSelectedLikelihood(int value) {
    likelihoodAndSeverity['likelihood'] = value;
    notifyListeners();
  }

  void setSelectedSeverity(int value) {
    likelihoodAndSeverity['severity'] = value;
    notifyListeners();
  }

  int get risk {
    return (getSelectedLikelihood() + 1) + (getSelectedSeverity() + 1);
  }

  Color? getColor() {
    if (getSelectedLikelihood() == 0 && getSelectedSeverity() == 3) {
      return Colors.green;
    } else if (risk > 0 && risk <= 4) {
      return Colors.green;
    } else if (risk > 3 && risk <= 7) {
      return Colors.amber;
    } else if (risk > 7 && risk < 11) {
      return Colors.red;
    } else {
      return Colors.transparent;
    }
    //return null;
    //return null;
  }

  String getText() {
    if (getSelectedLikelihood() == 0 && getSelectedSeverity() == 3) {
      return "Acceptable";
    } else if (risk > 0 && risk <= 4) {
      return "Acceptable";
    } else if (risk > 3 && risk <= 7) {
      return "Review";
    } else if (risk > 7 && risk < 11) {
      return "Unacceptable";
    } else {
      return "";
    }
  }
}
