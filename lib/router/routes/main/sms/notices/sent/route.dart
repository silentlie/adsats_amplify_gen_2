import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmsSentShellBranchData extends StatefulShellBranchData {
  const SmsSentShellBranchData();
  static const branch = TypedStatefulShellBranch<SmsSentShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SmsSentRoute.route,
    ],
  );
}

class SmsSentRoute extends RouteInfo with $SmsSentRoute {
  const SmsSentRoute();
  static const route = TypedGoRoute<SmsSentRoute>(
    path: 'sent',
    name: 'SMS Sent',
  );

  @override
  Icon get icon => const Icon(Icons.outbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.outbox);
  @override
  String get label => 'My Sent Items';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SmsSentPage());
  }
}
