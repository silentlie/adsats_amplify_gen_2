import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'external/route.dart';
export 'internal/route.dart';

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
