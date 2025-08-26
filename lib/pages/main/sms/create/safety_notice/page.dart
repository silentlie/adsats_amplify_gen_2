
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/state.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SafetyNoticePage extends StatelessWidget {
  const SafetyNoticePage({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        noticeNotifierProvider,
        selectedFilesProvider,
      ],
      child: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.read(noticeNotifierProvider.notifier);
          notifier.setNotice(
            notice ??
                Notice(
                  subject: "",
                  archived: false,
                  details: "{}",
                  type: NoticeType.Safety_notice,
                  status: NoticeStatus.Open,
                  aircraft: [],
                  documents: [],
                  recipients: [],
                ),
            notice != null,
          );
          return Center(
            child: Form(
              key: ref.watch(
                noticeNotifierProvider.select(
                  (value) => value.formKey,
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1536.0),
                  child: Card(
                    child: Column(
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
                        NoticeBasicDetailsWidget(),
                        const Divider(),
                        SafetyNoticeBody(),
                        const Divider(),
                        NoticeRecipientsWidget(),
                        const Divider(),
                        NoticeDocumentsWidget(),
                        const Divider(),
                        ActionsRowWidget()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SafetyNoticeBody extends ConsumerWidget {
  const SafetyNoticeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    return Column(
      children: [
        GlobalTextFormField(
          labelText: "Potential safety risk",
          onSaved: (value) {
            notifier.updateDetails({"title": value});
          },
          initialValue: details["title"],
          enabled: isEditMode,
        ),
        GlobalTextFormField(
          labelText: "Message",
          onSaved: (value) {
            notifier.updateDetails({"message": value});
          },
          initialValue: details["message"],
          enabled: isEditMode,
          minLines: 5,
        ),
      ],
    );
  }
}
