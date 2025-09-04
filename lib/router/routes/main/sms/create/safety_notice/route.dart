import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SafetyNoticeShellBranchData extends StatefulShellBranchData {
  const SafetyNoticeShellBranchData();
  static const branch = TypedStatefulShellBranch<SafetyNoticeShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SafetyNoticeRoute.route,
    ],
  );
}

class SafetyNoticeRoute extends RouteInfo with $SafetyNoticeRoute {
  const SafetyNoticeRoute();
  static const route = TypedGoRoute<SafetyNoticeRoute>(
    path: 'safety-notice',
    name: 'Safety Notice',
  );

  @override
  Icon get icon => const Icon(Icons.gpp_maybe_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.gpp_maybe);
  @override
  String get label => 'Safety Notice';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SafetyNoticePage());
  }
}
