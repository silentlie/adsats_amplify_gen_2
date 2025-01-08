import 'package:adsats_amplify_gen_2/helper/future_multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

part 'hazard_report_components.dart';

class HazardReportWidget extends StatelessWidget {
  const HazardReportWidget({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoticeNotifier>(
      create: (context) => NoticeNotifier.hazardReport(
        context: context,
        notice: notice,
      ),
      lazy: false,
      builder: (context, child) {
        return Form(
          key: Provider.of<NoticeNotifier>(context, listen: false).formKey,
          child: SingleChildScrollView(
            child: HazardReportBody(),
          ),
        );
      },
    );
  }
}

class HazardReportBody extends StatefulWidget {
  const HazardReportBody({super.key});

  @override
  State<HazardReportBody> createState() => _HazardReportBodyState();
}

class _HazardReportBodyState extends State<HazardReportBody> {
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
            'Hazard report',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        NoticeBasicWidget(),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: GlobalTextFormField(
                labelText: "Location",
                onSaved: (value) {
                  noticeNotifier.details["location"] = value;
                },
                initialValue: noticeNotifier.details["location"],
                enabled: noticeNotifier.editMode,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: false, label: "Open"),
                    DropdownMenuEntry(value: true, label: "Confidential"),
                  ],
                  enabled: noticeNotifier.editMode,
                  onSelected: (value) {
                    noticeNotifier.details["isConfidential"] = value!;
                  },
                  hintText: "Is this report confidential?",
                  expandedInsets: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
        GlobalTextFormField(
          labelText: "Describe the Hazard or the Event",
          onSaved: (value) {
            noticeNotifier.details["description"] = value;
          },
          initialValue: noticeNotifier.details["description"],
          enabled: noticeNotifier.editMode,
          minLines: 5,
        ),
        MitigateCommentWidget(),
        // Add components
        SafetyOfficersSection(),
        // Add components
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
            if (noticeNotifier.editMode &&
                noticeNotifier.status != NoticeStatus.Resolved)
              Expanded(
                child: Center(
                  child: Text("This notice will be sent to Safety officers"),
                ),
              ),
            if (noticeNotifier.editMode &&
                noticeNotifier.status == NoticeStatus.Resolved)
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
            if (noticeNotifier.editMode &&
                noticeNotifier.status == NoticeStatus.Resolved)
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
        ActionsRowWidget(),
      ],
    );
  }
}
