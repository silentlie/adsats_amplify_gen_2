import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/hazard_report/components.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/state.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HazardReportPage extends ConsumerWidget {
  const HazardReportPage({
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
        noticeNotifierProvider.overrideWith(
          () => NoticeNotifier.withNotice(
            notice ??
                Notice(
                  subject: "",
                  archived: false,
                  details: "{}",
                  author: userDetails,
                  type: NoticeType.Hazard_report,
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
      child: const HazardReportForm(),
    );
  }
}

class HazardReportForm extends ConsumerWidget {
  const HazardReportForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      'Hazard Report',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}

class HazardReportBody extends ConsumerWidget {
  const HazardReportBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeNotifierProvider.select(
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
