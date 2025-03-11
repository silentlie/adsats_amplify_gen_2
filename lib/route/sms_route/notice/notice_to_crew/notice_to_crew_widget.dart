import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/documents_view_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_recipients_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_basic_widget.dart';
import 'package:flutter/material.dart';
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
        NoticeRecipientsWidget(),
        const Divider(),
        DocumentsViewWidget(),
        const Divider(),
        ActionsRowWidget()
      ],
    );
  }
}
