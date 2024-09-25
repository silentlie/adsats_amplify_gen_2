import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
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
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class NoticeToCrewWidget extends StatefulWidget {
  const NoticeToCrewWidget({super.key, this.notice});
  final Notice? notice;

  @override
  State<NoticeToCrewWidget> createState() => _NoticeToCrewWidgetState();
}

class _NoticeToCrewWidgetState extends State<NoticeToCrewWidget> {
  late Notice notice = widget.notice ??
      Notice(
        subject: "",
        archived: false,
        details: "{}",
        type: NoticeType.Notice_to_Crew,
        status: NoticeStatus.Draft,
      );
  final formKey = GlobalKey<FormState>();
  late bool editMode = widget.notice == null;

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Aircraft> aircraft = notice.aircraft
            ?.map(
              (e) => e.aircraft!,
            )
            .toList() ??
        [];
    List<Staff> staff = notice.recipients
            ?.map(
              (e) => e.staff!,
            )
            .toList() ??
        [];
    Map<String, dynamic> details = json.decode(notice.details);
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Notice to Crew',
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
                  toList: (allData) {
                    return allData.map(
                      (e) {
                        return DropdownMenuEntry(
                          value: e,
                          label: e.name,
                        );
                      },
                    ).toList();
                  },
                  onSelected: (value) {
                    notice = notice.copyWith(author: value);
                  },
                  enabled: editMode,
                  initialSelection: notice.author,
                  text: "Specify Author of this notice",
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
                  initialValue: notice.noticed_at,
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
                    notice = notice.copyWith(subject: value);
                  },
                  initialValue: notice.subject,
                  enabled: editMode,
                ),
              ),
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
                  text: "Add aircraft",
                  title: const Text("Add aircraft"),
                  enabled: editMode,
                ),
              ),
            ],
          ),
          const Divider(),
          GlobalTextFormField(
            labelText: "Message",
            onSaved: (value) {
              details["message"] = value;
            },
            initialValue: details["message"],
            enabled: editMode,
            minLines: 5,
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: FutureMultiSelect<Staff>(
                  modelType: Staff.classType,
                  items: (allData) {
                    return allData
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList();
                  },
                  onSelected: (options) {
                    staff = options.cast<Staff>();
                  },
                  initialSelection: staff,
                  text: "Add recipients",
                  title: const Text("Add recipients"),
                  enabled: editMode,
                ),
              ),
            ],
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    context.go('/sms');
                  },
                  label: const Text('Cancel'),
                ),
                if (widget.notice != null)
                  ElevatedButton.icon(
                    onPressed: () async {
                      final user = authNotifier.user;
                      await update(
                        NoticeStaff(
                          staff: user,
                          notice: notice,
                          read_at: TemporalDateTime.now(),
                        ),
                      );
                      if (!context.mounted) return;
                      context.go('/sms');
                    },
                    label: const Text('Mark as read'),
                  ),
                const SizedBox(width: 10),
                if (widget.notice != null &&
                    (authNotifier.isAdmin || authNotifier.isEditor))
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        editMode = true;
                      });
                    },
                    label: const Text('Edit Mode'),
                  ),
                const SizedBox(width: 10),
                if (editMode)
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        notice = notice.copyWith(details: details.toString());
                        print(notice);
                        // if (!context.mounted) return;
                        // context.go('/sms');
                      }
                      // TODO:
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        colorScheme.secondary,
                      ),
                    ),
                    label: Text(
                      'Save',
                      style: TextStyle(color: colorScheme.onSecondary),
                    ),
                    icon: Icon(
                      Icons.mail,
                      color: colorScheme.onSecondary,
                    ),
                  ),
                const SizedBox(width: 10),
                if (editMode)
                  ElevatedButton.icon(
                    onPressed: () async {
                      // TODO:
                      notice = notice.copyWith(details: details.toString());
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
                        create(notice);
                      } else {
                        await Future.wait([
                          update(notice),
                          updateAircraftNotice(notice, aircraft),
                        ]);
                      }
                      if (!context.mounted) return;
                      context.go('/sms');
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
            ),
          ),
        ],
      ),
    );
  }
}
