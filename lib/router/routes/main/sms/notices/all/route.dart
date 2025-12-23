import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmsAllShellBranchData extends StatefulShellBranchData {
  const SmsAllShellBranchData();
  static const branch = TypedStatefulShellBranch<SmsAllShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SmsAllRoute.route,
    ],
  );
}

class SmsAllRoute extends RouteInfo with $SmsAllRoute {
  const SmsAllRoute();
  static const route = TypedGoRoute<SmsAllRoute>(
    path: 'all',
    name: 'SMS All',
  );

  @override
  Icon get icon => const Icon(Icons.all_inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.all_inbox);
  @override
  String get label => 'All';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SmsAllPage());
  }
}
