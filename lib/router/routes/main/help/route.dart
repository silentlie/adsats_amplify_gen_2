import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpShellBranchData extends StatefulShellBranchData {
  const HelpShellBranchData();
  static const branch = TypedStatefulShellBranch<HelpShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      HelpRoute.route,
    ],
  );
}

class HelpRoute extends RouteInfo with $HelpRoute {
  const HelpRoute();

  static const route = TypedGoRoute<HelpRoute>(
    path: '/help',
    name: 'Help',
  );

  @override
  Icon get icon => const Icon(Icons.help_outline);
  @override
  Icon get selectedIcon => const Icon(Icons.help);
  @override
  String get label => 'Help';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HelpPage());
  }
}
