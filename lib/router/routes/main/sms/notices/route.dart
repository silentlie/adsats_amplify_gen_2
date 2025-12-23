import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'all/route.dart';
export 'inbox/route.dart';
export 'sent/route.dart';

class SmsShellRouteData extends StatefulShellRouteInfo {
  const SmsShellRouteData();
  static const route = TypedStatefulShellRoute<SmsShellRouteData>(
    branches: [
      SmsAllShellBranchData.branch,
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
