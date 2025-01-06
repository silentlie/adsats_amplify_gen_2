import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/future_multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class NoticeToCrewWidget extends StatelessWidget {
  const NoticeToCrewWidget({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoticeNotifier>(
      create: (context) => NoticeNotifier.noticeToCrew(
        context: context,
        notice: notice,
      ),
      lazy: false,
      builder: (context, child) {
        return Form(
          key: Provider.of<NoticeNotifier>(context).formKey,
          child: SingleChildScrollView(
            child: NoticeToCrewBody(),
          ),
        );
      },
    );
  }
}

class NoticeToCrewBody extends StatefulWidget {
  const NoticeToCrewBody({super.key});

  @override
  State<NoticeToCrewBody> createState() => _NoticeToCrewBodyState();
}

class _NoticeToCrewBodyState extends State<NoticeToCrewBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    final noticeNotifier = Provider.of<NoticeNotifier>(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            'Notice to Crew',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const Divider(),
        if (authNotifier.isEditor)
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
        const Divider(),
        GlobalTextFormField(
          labelText: "Message",
          onSaved: (value) {
            noticeNotifier.details["message"] = value!;
          },
          initialValue: noticeNotifier.details["message"],
          enabled: noticeNotifier.editMode,
          minLines: 5,
        ),
        const Divider(),
        Row(
          children: [
            if (noticeNotifier.editMode)
              Expanded(
                child: FutureMultiSelect<Aircraft>(
                  modelType: Aircraft.classType,
                  items: (allData) {
                    return allData
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList();
                  },
                  onSelected: (options) {
                    noticeNotifier.aircraft = options.cast<Aircraft>();
                  },
                  initialSelection: noticeNotifier.aircraft,
                  text: "Aircraft",
                  title: const Text("Add aircraft"),
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
            if (noticeNotifier.editMode)
              Expanded(
                child: FutureMultiSelect<Staff>(
                  modelType: Staff.classType,
                  items: (allData) {
                    return allData
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList();
                  },
                  onSelected: (options) {
                    noticeNotifier.recipients = options.cast<Staff>();
                  },
                  initialSelection: noticeNotifier.recipients,
                  text: "Recipients",
                  title: const Text("Add recipients"),
                  enabled: true,
                ),
              ),
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
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: noticeNotifier.actionsRow(context, setState),
        ),
      ],
    );
  }
}
