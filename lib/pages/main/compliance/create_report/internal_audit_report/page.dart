part of 'route.dart';

class InternalAuditReportPage extends StatelessWidget {
  const InternalAuditReportPage({
    super.key,
    this.report,
  });
  final Report? report;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [reportNotifierProvider],
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
                ),
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
        QualityManagerSection(),
      ],
    );
  }
}
