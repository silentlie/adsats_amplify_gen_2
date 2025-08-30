import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SafetyNoticePage extends ConsumerWidget {
  const SafetyNoticePage({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.read(userDetailsProvider.select(
      (value) => value.value!,
    ));
    return ProviderScope(
      overrides: [
        noticeFormProvider.overrideWith(
          () => NoticeForm.withNotice(
            notice ??
                Notice(
                  subject: "",
                  archived: false,
                  details: "{}",
                  author: userDetails,
                  type: NoticeType.Safety_notice,
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
      // Ensure new ref have access to the override state
      child: SafetyNoticeForm(),
    );
  }
}

// Ensure new ref have access to the override state
class SafetyNoticeForm extends ConsumerWidget {
  const SafetyNoticeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: GlobalKey<FormState>(),
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
    );
  }
}

class SafetyNoticeBody extends ConsumerWidget {
  const SafetyNoticeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(noticeFormProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(
      noticeFormProvider.select(
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
