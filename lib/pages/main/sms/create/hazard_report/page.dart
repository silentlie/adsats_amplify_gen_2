import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/hazard_report/components.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class HazardReportPage extends HookConsumerWidget {
  const HazardReportPage({
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
            type: NoticeType.Hazard_report,
            status: NoticeStatus.Open,
            aircraft: const [],
            documents: const [],
            recipients: const [],
          );
      final form = NoticeForm.withNotice(initial, notice == null);
      final noticeFormOverride = noticeFormProvider.overrideWith(() => form);
      return <Override>[
        noticeFormOverride,
        selectedFilesProvider,
      ];
    }, [userDetails, notice]);
    return ProviderScope(
      overrides: overrides,
      // Ensure new ref have access to the override state
      child: const HazardReportForm(),
    );
  }
}

class HazardReportForm extends ConsumerWidget {
  const HazardReportForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          NoticeBasicDetailsWidget(),
          const Divider(),
          HazardReportBody(),
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

class HazardReportBody extends ConsumerWidget {
  const HazardReportBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(
      noticeFormProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeFormProvider.select(
      (value) => value.details,
    ));
    return Column(
      children: [
        GlobalTextFormField(
          labelText: "Location",
          onSaved: (value) {
            notifier.updateDetails({"location": value});
          },
          initialValue: details["location"],
          enabled: isEditMode,
        ),
        GlobalTextFormField(
          labelText: "Describe the Hazard or the Event",
          onSaved: (value) {
            notifier.updateDetails({"description": value});
          },
          initialValue: details["description"],
          enabled: isEditMode,
          minLines: 5,
        ),
        MitigateCommentWidget(),
        RiskWidget(),
        SafetyOfficersSection(),
      ],
    );
  }
}
