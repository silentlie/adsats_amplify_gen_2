import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticeBasicWidget extends StatelessWidget {
  const NoticeBasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    return Column(
      children: [
        const Divider(),
        if (authNotifier.isSafetyOfficer)
          Row(
            children: [
              Expanded(
                child: GlobalTextFormField(
                  labelText: 'Notice ID',
                  enabled: false,
                  initialValue: noticeNotifier.id,
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
                    noticeNotifier.author = value!;
                  },
                  enabled: noticeNotifier.editMode,
                  initialSelection: noticeNotifier.author,
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
                  noticeNotifier.noticedAt = value;
                },
                enabled: noticeNotifier.editMode,
                initialValue: noticeNotifier.noticedAt,
                firstDate:
                    DateTime.now().subtract(const Duration(days: 365 * 10)),
                lastDate: DateTime.now(),
              ),
            ),
            Expanded(
              child: DatePickerWidget(
                text: "Deadline Date",
                onSelected: (value) {
                  noticeNotifier.deadlineAt = value;
                },
                enabled: noticeNotifier.editMode,
                initialValue: noticeNotifier.deadlineAt,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
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
                  noticeNotifier.subject = value!;
                },
                initialValue: noticeNotifier.subject,
                enabled: noticeNotifier.editMode,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: NoticeStatus.values
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList(),
                  initialSelection: noticeNotifier.status,
                  enabled: noticeNotifier.editMode,
                  onSelected: (value) => noticeNotifier.status = value!,
                  hintText: "Status of this notice",
                  menuHeight: 200,
                  expandedInsets: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
