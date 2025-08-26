part of '../../../route.dart';

class CreateReportShellRouteData extends StatefulShellRouteInfo {
  const CreateReportShellRouteData();

  static const route = TypedStatefulShellRoute<CreateReportShellRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      InternalAuditReportShellBranchData.branch,
      ExternalAuditReportShellBranchData.branch,
    ],
  );

  @override
  Icon get icon => const Icon(Icons.add_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.add);
  @override
  String get label => 'Create Report';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: CreateReportShell(navigationShell: navigationShell),
    );
  }
}
