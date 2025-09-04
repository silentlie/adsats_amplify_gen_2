import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CmsInboxShellBranchData extends StatefulShellBranchData {
  const CmsInboxShellBranchData();
  static const branch = TypedStatefulShellBranch<CmsInboxShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      CmsInboxRoute.route,
    ],
  );
}

class CmsInboxRoute extends RouteInfo with $CmsInboxRoute {
  const CmsInboxRoute();

  static const route = TypedGoRoute<CmsInboxRoute>(
    path: 'inbox',
    name: 'CMS Inbox',
  );

  @override
  Icon get icon => const Icon(Icons.inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.inbox);
  @override
  String get label => 'Inbox';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CmsInboxPage());
  }
}
