part of '../../../route.dart';

class SmsShellRouteData extends StatefulShellRouteInfo {
  const SmsShellRouteData();
  static const route = TypedStatefulShellRoute<SmsShellRouteData>(
    branches: [
      SmsInboxShellBranchData.branch,
      SmsSentShellBranchData.branch,
    ],
  );

  @override
  Icon get icon => const Icon(Icons.support_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.support);
  @override
  String get label => 'S.M.S';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: SmsShell(navigationShell: navigationShell),
    );
  }
}
