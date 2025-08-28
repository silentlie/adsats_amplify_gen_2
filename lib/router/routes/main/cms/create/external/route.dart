part of '../../../../route.dart';

class ExternalAuditReportShellBranchData extends StatefulShellBranchData {
  const ExternalAuditReportShellBranchData();
  static const branch =
      TypedStatefulShellBranch<ExternalAuditReportShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      ExternalAuditReportRoute.route,
    ],
  );
}

class ExternalAuditReportRoute extends RouteInfo
    with _$ExternalAuditReportRoute {
  const ExternalAuditReportRoute();

  static const route = TypedGoRoute<ExternalAuditReportRoute>(
    path: 'external-audit-report',
    name: 'External Audit Report',
  );

  @override
  Icon get icon => const Icon(Icons.find_in_page_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.find_in_page);
  @override
  String get label => 'External Audit Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ExternalAuditReportPage());
  }
}
