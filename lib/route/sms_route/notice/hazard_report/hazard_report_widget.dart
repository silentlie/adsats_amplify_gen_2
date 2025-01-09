import 'package:adsats_amplify_gen_2/helper/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/documents_view_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_recipients_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_basic_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
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
                  initialSelection:
                      noticeNotifier.details["isConfidential"] ?? false,
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
        RiskWidget(),
        SafetyOfficersSection(),
        const Divider(),
        NoticeRecipientsWidget(),
        const Divider(),
        DocumentsViewWidget(),
        const Divider(),
        ActionsRowWidget(),
      ],
    );
  }
}
