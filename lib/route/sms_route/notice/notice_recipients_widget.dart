import 'package:adsats_amplify_gen_2/helper/future_multi_select.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class NoticeRecipientsWidget extends StatelessWidget {
  const NoticeRecipientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    final isNoticeToCrew = noticeNotifier.type == NoticeType.Notice_to_Crew;
    final isSafetyOfficerViewed =
        noticeNotifier.status == NoticeStatus.Resolved ||
            noticeNotifier.status == NoticeStatus.Pending;
    return Row(
      children: [
        if (noticeNotifier.editMode)
          Expanded(
            child: FutureMultiSelect<Aircraft>(
              modelType: Aircraft.classType,
              items: (allData) {
                return allData.map((e) => MultiSelectItem(e, e.name)).toList();
              },
              onSelected: (options) {
                noticeNotifier.aircraft = options.cast<Aircraft>();
              },
              initialSelection: noticeNotifier.aircraft,
              text: "Aircraft",
              title: const Text("Aircraft"),
              enabled: true,
            ),
          ),
        if (noticeNotifier.editMode &&
            !isSafetyOfficerViewed &&
            !isNoticeToCrew)
          Expanded(
            child: Center(
              child: Text("This notice will be sent to Safety officers"),
            ),
          ),
        if (noticeNotifier.editMode &&
            (isSafetyOfficerViewed || isNoticeToCrew))
          Expanded(
            child: FutureMultiSelect<Role>(
              modelType: Role.classType,
              items: (allData) {
                return allData.map((e) => MultiSelectItem(e, e.name)).toList();
              },
              onSelected: (options) {
                noticeNotifier.roles = options.cast<Role>();
              },
              initialSelection: noticeNotifier.roles,
              text: "Roles",
              title: const Text("Roles"),
              enabled: true,
            ),
          ),
        if (noticeNotifier.editMode &&
            (isSafetyOfficerViewed || isNoticeToCrew))
          Expanded(
            child: FutureMultiSelect<Staff>(
              modelType: Staff.classType,
              items: (allData) {
                return allData.map((e) => MultiSelectItem(e, e.name)).toList();
              },
              onSelected: (options) {
                noticeNotifier.recipients = options.cast<Staff>();
              },
              initialSelection: noticeNotifier.recipients,
              text: "Recipients",
              title: const Text("Recipients"),
              enabled: true,
            ),
          ),
        if (!noticeNotifier.editMode)
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Aircraft:"),
                ...noticeNotifier.aircraft.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text(e.name)),
                    ))
              ],
            ),
          )),
        if (!noticeNotifier.editMode)
          Expanded(
            child: Row(
              children: [
                Text("Recipients:"),
                ...noticeNotifier.recipients.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text(e.name)),
                    )),
                if (noticeNotifier.recipients.isEmpty) Text("None"),
              ],
            ),
          ),
      ],
    );
  }
}
