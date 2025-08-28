import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/state.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeToCrewPage extends ConsumerWidget {
  const NoticeToCrewPage({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.read(userDetailsProvider).value!;
    return ProviderScope(
      overrides: [
        noticeNotifierProvider.overrideWith(
          () => NoticeNotifier.withNotice(
            notice ??
                Notice(
                  subject: "",
                  archived: false,
                  details: "{}",
                  author: userDetails,
                  type: NoticeType.Notice_to_Crew,
                  status: NoticeStatus.Open,
                  aircraft: [],
                  documents: [],
                  recipients: [],
                ),
            notice == null,
          ),
        ),
        selectedFilesProvider,
      ],
      child: Center(
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
                        'Notice to Crew',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    NoticeBasicDetailsWidget(),
                    const Divider(),
                    NoticeToCrewBody(),
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
      ),
    );
  }
}

class NoticeToCrewBody extends ConsumerWidget {
  const NoticeToCrewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(noticeNotifierProvider.notifier);
    return GlobalTextFormField(
      labelText: "Message",
      onSaved: (value) {
        notifier.updateDetails({"message": value});
      },
      initialValue: details["message"],
      enabled: ref.watch(
        noticeNotifierProvider.select(
          (value) => value.editMode,
        ),
      ),
      minLines: 5,
    );
  }
}
