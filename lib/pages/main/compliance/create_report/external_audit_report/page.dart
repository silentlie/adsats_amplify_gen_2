part of 'route.dart';

class ExternalAuditReportPage extends StatelessWidget {
  const ExternalAuditReportPage({
    super.key,
    this.report,
  });
  final Report? report;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [reportNotifierProvider, selectedFilesProvider],
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
                    type: ReportType.External_audit_report,
                    documents: []),
            report != null,
          );
          return Center(
            child: Form(
              key: ref.watch(
                reportNotifierProvider.select(
                  (value) {
                    return value.formKey;
                  },
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
                            'External Audit Report',
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

class ExternalAuditReportBody extends ConsumerWidget {
  const ExternalAuditReportBody({super.key});

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
          labelText: 'Company audited',
          onSaved: (value) {
            notifier.updateDetails({'company': value});
          },
          initialValue: details["company"],
          enabled: isEditMode,
        ),
        GlobalTextFormField(
          labelText: 'Bussiness relationship',
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
        GlobalTextFormField(
          labelText: "Comments",
          onSaved: (value) {
            notifier.updateDetails({'comments': value});
          },
          initialValue: details["comments"],
          enabled: isEditMode,
          minLines: 3,
        ),
        QualityManagerSection()
      ],
    );
  }
}