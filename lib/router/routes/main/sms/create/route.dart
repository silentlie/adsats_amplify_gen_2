part of '../../../route.dart';

class CreateNoticeShellRouteData extends StatefulShellRouteInfo {
  const CreateNoticeShellRouteData();

  static const route = TypedStatefulShellRoute<CreateNoticeShellRouteData>(
    branches: [
      SafetyNoticeShellBranchData.branch,
      HazardReportShellBranchData.branch,
      NoticeToCrewShellBranchData.branch,
    ],
  );

  @override
  Icon get icon => const Icon(Icons.add_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.add);
  @override
  String get label => 'Create Notice';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: CreateNoticeShell(navigationShell: navigationShell),
    );
  }
}
