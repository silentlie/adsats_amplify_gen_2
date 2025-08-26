part of '../../../route.dart';

class CmsShellRouteData extends StatefulShellRouteInfo {
  const CmsShellRouteData();
  static const route = TypedStatefulShellRoute<CmsShellRouteData>(
    branches: [
      CmsInboxShellBranchData.branch,
      CmsSentShellBranchData.branch,
    ],
  );  

  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'C.M.S';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: CmsShell(navigationShell: navigationShell),
    );
  }
}
