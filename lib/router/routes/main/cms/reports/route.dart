import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'all/route.dart';
export 'inbox/route.dart';
export 'sent/route.dart';

class CmsShellRouteData extends StatefulShellRouteInfo {
  const CmsShellRouteData();
  static const route = TypedStatefulShellRoute<CmsShellRouteData>(
    branches: [
      CmsAllShellBranchData.branch,
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
