part of '../route.dart';

class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();
  static const route = TypedStatefulShellRoute<MainShellRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      HomeShellBranchData.branch,
      DocumentsShellBranchData.branch,
      SMSShellBranchData.branch,
      CmsShellBranchData.branch,
      FlightCrewRecordsShellBranchData.branch,
      HelpShellBranchData.branch,
      KPIShellBranchData.branch,
    ],
  );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainShell(
      navigationShell: navigationShell,
    );
  }
}
