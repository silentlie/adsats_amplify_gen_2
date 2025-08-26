part of '../../../../route.dart';

class InternalAuditReportShellBranchData extends StatefulShellBranchData {
  const InternalAuditReportShellBranchData();
  static const branch = TypedStatefulShellBranch<InternalAuditReportShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      InternalAuditReportRoute.route,
    ],
  );
}

class InternalAuditReportRoute extends RouteInfo with _$InternalAuditReportRoute{
  const InternalAuditReportRoute();
  static const route = TypedGoRoute<InternalAuditReportRoute>(
    path: 'internal-audit-report',
    name: 'Internal Audit Report',
  );

  @override
  Icon get icon => const Icon(Icons.plagiarism_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.plagiarism);
  @override
  String get label => 'Internal Audit Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: InternalAuditReportPage());
  }
}
