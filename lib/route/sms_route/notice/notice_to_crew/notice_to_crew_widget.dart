import 'package:adsats_amplify_gen_2/helper/future_multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice_basic_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    noticeNotifier.setState = setState;
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
        NoticeBasicWidget(),
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
        ActionsRowWidget()
      ],
    );
  }
}
