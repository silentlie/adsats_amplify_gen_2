import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/widgets/components.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/widgets/documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/widgets/report_actions_row.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/widgets/report_basic_details.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/widgets/report_recipients.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/form.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExternalAuditReportPage extends ConsumerWidget {
  const ExternalAuditReportPage({
    super.key,
    this.report,
  });
  final Report? report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userDetailsProvider.select(
      (value) => value.value!,
    ));
    return ProviderScope(
      overrides: [
        reportFormProvider.overrideWith(() {
          return ReportForm.withReport(
            report ??
                Report(
                  subject: "",
                  archived: false,
                  details: "{}",
                  recipients: [],
                  status: ReportStatus.Open,
                  type: ReportType.External_audit_report,
                  documents: [],
                  auditor: userDetails,
                  discrepanciesFound: false,
                ),
            report != null,
          );
        }),
        selectedFilesProvider,
      ],
      child: ExternalAuditReportForm(),
    );
  }
}

class ExternalAuditReportForm extends StatelessWidget {
  const ExternalAuditReportForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'External Audit Report',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ReportBasicDetails(),
          const Divider(),
          ExternalAuditReportBody(),
          const Divider(),
          ReportRecipients(),
          const Divider(),
          ReportDocuments(),
          const Divider(),
          ReportActionsRow(),
        ],
      ),
    );
  }
}

class ExternalAuditReportBody extends ConsumerWidget {
  const ExternalAuditReportBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.read(reportFormProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(reportFormProvider.notifier);
    final isEditMode = ref.watch(
      reportFormProvider.select(
        (value) => value.editMode,
      ),
    );
    return Column(
      children: [
        GlobalTextFormField(
          labelText: 'Company audited',
          onSaved: (value) {
            notifier.updateDetails({'company': value});
          },
          initialValue: details["company"],
          enabled: isEditMode,
        ),
        GlobalTextFormField(
          labelText: 'Business relationship',
          onSaved: (value) {
            notifier.updateDetails({'relationship': value});
          },
          initialValue: details["relationship"],
          enabled: isEditMode,
        ),
        GlobalTextFormField(
          labelText: 'Location of audit',
          onSaved: (value) {
            notifier.updateDetails({'location': value});
          },
          initialValue: details["location"],
          enabled: isEditMode,
        ),
        GlobalTextFormField(
          labelText: "Audit Scope",
          onSaved: (value) {
            notifier.updateDetails({'scope': value});
          },
          initialValue: details["scope"],
          enabled: isEditMode,
          minLines: 3,
        ),
        GlobalTextFormField(
          labelText: "Audit notes",
          onSaved: (value) {
            notifier.updateDetails({'notes': value});
          },
          initialValue: details["notes"],
          enabled: isEditMode,
          minLines: 5,
        ),
        DiscrepanciesWidget(),
        if (ref.watch(isComplianceManagerProvider)) ComplianceManagerSection()
      ],
    );
  }
}
