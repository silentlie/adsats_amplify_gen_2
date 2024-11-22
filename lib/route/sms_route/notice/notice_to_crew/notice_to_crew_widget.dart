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
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class NoticeToCrewWidget extends StatefulWidget {
  const NoticeToCrewWidget({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  State<NoticeToCrewWidget> createState() => _NoticeToCrewWidgetState();
}

class _NoticeToCrewWidgetState extends State<NoticeToCrewWidget> {
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
          type: NoticeType.Notice_to_Crew,
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
                      onSelected: (value) =>
                          notice = notice.copyWith(status: value),
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
                details["message"] = value;
              },
              initialValue: details["message"],
              enabled: editMode,
              minLines: 5,
            ),
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
                if (editMode)
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
            actionsRow(context, authNotifier),
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
        if (widget.notice != null && authNotifier.isEditor)
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
