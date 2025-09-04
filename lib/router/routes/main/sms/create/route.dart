import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'hazard_report/route.dart';
export 'notice_to_crew/route.dart';
export 'safety_notice/route.dart';

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
