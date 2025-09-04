import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'home/route.dart';
export 'help/route.dart';
export 'documents/route.dart';
export 'sms/route.dart';
export 'cms/route.dart';
export 'flight_crew_records/route.dart';
export 'kpi/route.dart';

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
