import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StaffShellBranchData extends StatefulShellBranchData {
  const StaffShellBranchData();
  static const branch = TypedStatefulShellBranch<StaffShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      StaffRoute.route,
    ],
  );
}

class StaffRoute extends RouteInfo with $StaffRoute {
  const StaffRoute();

  static const route = TypedGoRoute<StaffRoute>(
    path: '/admin/staff',
    name: 'Staff',
  );

  @override
  Icon get icon => const Icon(Icons.people_outline);
  @override
  Icon get selectedIcon => const Icon(Icons.people);
  @override
  String get label => 'Staff';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: StaffPage());
  }
}
