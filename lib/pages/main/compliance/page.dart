part of 'route.dart';

class CompliancePage extends StatelessWidget {
  const CompliancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Quick navigation:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                children: [
                  NavigateIconButton(
                    icon: ComplianceInboxRoute().icon.icon!,
                    name: ComplianceInboxRoute().label,
                    onPressed: () => ComplianceInboxRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: ComplianceSentRoute().icon.icon!,
                    name: ComplianceSentRoute().label,
                    onPressed: () => ComplianceSentRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: InternalAuditReportRoute().icon.icon!,
                    name: InternalAuditReportRoute().label,
                    onPressed: () => InternalAuditReportRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: ExternalAuditReportRoute().icon.icon!,
                    name: ExternalAuditReportRoute().label,
                    onPressed: () => ExternalAuditReportRoute().go(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
