import 'dart:convert';

import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}