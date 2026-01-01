import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CmsAllShellBranchData extends StatefulShellBranchData {
  const CmsAllShellBranchData();
  static const branch = TypedStatefulShellBranch<CmsAllShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      CmsAllRoute.route,
    ],
  );
}

class CmsAllRoute extends RouteInfo with $CmsAllRoute {
  const CmsAllRoute();
  static const route = TypedGoRoute<CmsAllRoute>(
    path: 'all',
    name: 'CMS All',
  );

  @override
  Icon get icon => const Icon(Icons.all_inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.all_inbox);
  @override
  String get label => 'All';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CmsAllPage());
  }
}
