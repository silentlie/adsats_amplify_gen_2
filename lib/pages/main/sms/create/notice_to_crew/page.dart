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
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([SelectedFiles])
class NoticeToCrewPage extends HookConsumerWidget {
  const NoticeToCrewPage({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userDetailsProvider.select(
      (value) => value.value,
    ));
    if (userDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final overrides = useMemoized(() {
      final initial = notice ??
          Notice(
            subject: "",
            archived: false,
            details: "{}",
            author: userDetails,
            type: NoticeType.Notice_to_Crew,
            status: NoticeStatus.Open,
            aircraft: const [],
            documents: const [],
            recipients: const [],
          );
      final form = NoticeForm.withNotice(initial, notice == null);
      final override = noticeFormProvider.overrideWith(() => form);

      return <Override>[
        override,
        selectedFilesProvider,
      ];
    }, [userDetails, notice]);
    return ProviderScope(
      overrides: overrides,
      // Ensure new ref have access to the override state
      child: const NoticeToCrewForm(),
    );
  }
}

// Ensure new ref have access to the override state
class NoticeToCrewForm extends ConsumerWidget {
  const NoticeToCrewForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
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
    );
  }
}

@Dependencies([NoticeForm])
class NoticeToCrewBody extends ConsumerWidget {
  const NoticeToCrewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(noticeFormProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(noticeFormProvider.notifier);
    return GlobalTextFormField(
      labelText: "Message",
      onSaved: (value) {
        notifier.updateDetails({"message": value});
      },
      initialValue: details["message"],
      enabled: ref.watch(
        noticeFormProvider.select(
          (value) => value.editMode,
        ),
      ),
      minLines: 5,
    );
  }
}
