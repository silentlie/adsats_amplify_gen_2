import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CmsSentShellBranchData extends StatefulShellBranchData {
  const CmsSentShellBranchData();
  static const branch = TypedStatefulShellBranch<CmsSentShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      CmsSentRoute.route,
    ],
  );
}

class CmsSentRoute extends RouteInfo with $CmsSentRoute {
  const CmsSentRoute();
  static const route = TypedGoRoute<CmsSentRoute>(
    path: 'sent',
    name: 'CMS Sent',
  );

  @override
  Icon get icon => const Icon(Icons.outbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.outbox);
  @override
  String get label => 'My Sent Items';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CmsSentPage());
  }
}
