import 'package:adsats_amplify_gen_2/helper/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/documents_view_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_recipients_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SafetyNoticeWidget extends StatelessWidget {
  const SafetyNoticeWidget({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoticeNotifier>(
      create: (context) => NoticeNotifier.safetyNotice(
        context: context,
        notice: notice,
      ),
      lazy: false,
      builder: (context, child) {
        return Form(
          key: Provider.of<NoticeNotifier>(context, listen: false).formKey,
          child: SingleChildScrollView(
            child: SafetyNoticeBody(),
          ),
        );
      },
    );
  }
}

class SafetyNoticeBody extends StatefulWidget {
  const SafetyNoticeBody({super.key});

  @override
  State<SafetyNoticeBody> createState() => _SafetyNoticeBodyState();
}

class _SafetyNoticeBodyState extends State<SafetyNoticeBody> {
  @override
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    noticeNotifier.setState = setState;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            'Safety Notice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        NoticeBasicWidget(),
        const Divider(),
        GlobalTextFormField(
          labelText: "Potential safety risk",
          onSaved: (value) {
            noticeNotifier.details["title"] = value;
          },
          initialValue: noticeNotifier.details["title"],
          enabled: noticeNotifier.editMode,
        ),
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
        NoticeRecipientsWidget(),
        const Divider(),
        DocumentsViewWidget(),
        const Divider(),
        ActionsRowWidget(),
      ],
    );
  }
}
