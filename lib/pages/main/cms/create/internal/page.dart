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

class InternalAuditReportPage extends ConsumerWidget {
  const InternalAuditReportPage({
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
        reportFormProvider.overrideWith(
          () {
            return ReportForm.withReport(
              report ??
                  Report(
                      subject: "",
                      archived: false,
                      details: "{}",
                      recipients: [],
                      status: ReportStatus.Open,
                      type: ReportType.Internal_audit_report,
                      documents: [],
                      auditor: userDetails),
              report != null,
            );
          },
        ),
        selectedFilesProvider,
      ],
      child: const InternalAuditReportForm(),
    );
  }
}

class InternalAuditReportForm extends ConsumerWidget {
  const InternalAuditReportForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: GlobalKey<FormState>(),
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
          InternalAuditReportForm(),
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

class InternalAuditReportBody extends ConsumerWidget {
  const InternalAuditReportBody({super.key});

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
