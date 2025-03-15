part of 'route.dart';

class ViewReportPage extends ConsumerWidget {
  const ViewReportPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(reportRepoProvider(id)),
      data: (value) {
        return switch (value.type) {
          ReportType.Internal_audit_report => InternalAuditReportPage(
              report: value,
            ),
          ReportType.External_audit_report => ExternalAuditReportPage(
              report: value,
            ),
          _ => Center(
              child: Text("Unknown report type"),
            )
        };
      },
    );
  }
}
