part of '../../../../route.dart';

class HazardReportShellBranchData extends StatefulShellBranchData {
  const HazardReportShellBranchData();
  static const branch = TypedStatefulShellBranch<HazardReportShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      HazardReportRoute.route,
    ],
  );
}

class HazardReportRoute extends RouteInfo with _$HazardReportRoute {
  const HazardReportRoute();
  static const route = TypedGoRoute<HazardReportRoute>(
    path: 'hazard-report',
    name: 'Hazard Report',
  );

  @override
  Icon get icon => const Icon(Icons.report_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.report);
  @override
  String get label => 'Hazard Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HazardReportPage());
  }
}
