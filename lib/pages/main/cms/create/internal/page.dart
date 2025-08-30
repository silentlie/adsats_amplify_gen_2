import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/components.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/report_actions_row.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/report_basic_details.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/report_recipients.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/state.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InternalAuditReportPage extends StatelessWidget {
  const InternalAuditReportPage({
    super.key,
    this.report,
  });
  final Report? report;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        reportNotifierProvider,
        selectedFilesProvider,
      ],
      child: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.read(reportNotifierProvider.notifier);
          notifier.setReport(
            report ??
                Report(
                    subject: "",
                    archived: false,
                    details: "{}",
                    recipients: [],
                    status: ReportStatus.Open,
                    type: ReportType.Internal_audit_report,
                    documents: []),
            report != null,
          );
          return Form(
            key: ref.watch(
              reportNotifierProvider.select(
                (value) {
                  return value.formKey;
                },
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Internal Audit Report',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                ReportBasicDetails(),
                const Divider(),
                InternalAuditReportBody(),
                const Divider(),
                ReportRecipients(),
                const Divider(),
                ReportDocuments(),
                const Divider(),
                ReportActionsRow(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InternalAuditReportBody extends ConsumerWidget {
  const InternalAuditReportBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.read(reportNotifierProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(reportNotifierProvider.notifier);
    final isEditMode = ref.watch(
      reportNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    return Column(
      children: [
        GlobalTextFormField(
          labelText: "Audit Scope",
          onSaved: (value) {
            notifier.updateDetails({'scope': value});
          },
          initialValue: details["scope"],
          enabled: isEditMode,
        ),
        DiscrepanciesWidget(),
        if (ref.watch(isComplianceManagerProvider)) ComplianceManagerSection(),
      ],
    );
  }
}
