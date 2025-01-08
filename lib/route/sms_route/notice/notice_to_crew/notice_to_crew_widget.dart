import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/future_multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/sms_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          key: Provider.of<NoticeNotifier>(context, listen: false).formKey,
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
    final colorScheme = Theme.of(context).colorScheme;
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
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
                  title: const Text("Aircraft"),
                  enabled: true,
                ),
              ),
            if (noticeNotifier.editMode)
              Expanded(
                child: FutureMultiSelect<Role>(
                  modelType: Role.classType,
                  items: (allData) {
                    return allData
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList();
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
                  title: const Text("Recipients"),
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
        Consumer<NoticeNotifier>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ...value.documents.map(
                      (document) {
                        return Chip(
                          label: Text(document.name),
                          color: WidgetStatePropertyAll(colorScheme.onPrimary),
                          onDeleted: () => value.removeDocument(document),
                        );
                      },
                    ),
                    ...value.selectedFiles.map(
                      (file) {
                        return Chip(
                          label: Text(file.name),
                          onDeleted: () => value.removeFile(file),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.go(SMSWidget.path);
                  },
                  label: const Text('Cancel'),
                ),
              ),
              if (noticeNotifier.notice != null)
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: FutureBuilder(
                    future: list(
                      NoticeStaff.classType,
                      where: NoticeStaff.STAFF.eq(authNotifier.user.id).and(
                          NoticeStaff.NOTICE.eq(noticeNotifier.notice!.id)),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
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
                                (e) => update(e.copyWith(
                                    read_at: TemporalDateTime.now())),
                              ));
                              if (!context.mounted) return;
                              context.go(SMSWidget.path);
                            },
                            label: const Text('Mark as read'),
                            icon: Icon(Icons.mark_email_unread_outlined),
                          );
                        }
                      }
                    },
                  ),
                ),
              if (noticeNotifier.notice != null &&
                  (authNotifier.isEditor || authNotifier.isAdmin))
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        noticeNotifier.editMode = !noticeNotifier.editMode;
                      });
                    },
                    label: noticeNotifier.editMode
                        ? const Text('View Mode')
                        : const Text('Edit Mode'),
                  ),
                ),
              if (noticeNotifier.editMode)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult? filePickerResult =
                          await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                        type: FileType.any,
                        withData: false,
                        // Ensure to get file stream for better performance
                        withReadStream: true,
                      );
                      noticeNotifier.addFiles(filePickerResult?.files ?? []);
                    },
                    label: const Text("Pick file"),
                    icon: Icon(Icons.description_outlined),
                  ),
                ),
              if (noticeNotifier.editMode)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await noticeNotifier.saveNotice(false);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        colorScheme.secondary,
                      ),
                    ),
                    label: Text('Save',
                        style: TextStyle(color: colorScheme.onSecondary)),
                    icon: Icon(Icons.mail, color: colorScheme.onSecondary),
                  ),
                ),
              if (noticeNotifier.editMode)
                ElevatedButton.icon(
                  onPressed: () async {
                    await noticeNotifier.saveNotice(true);
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
    );
  }
}
