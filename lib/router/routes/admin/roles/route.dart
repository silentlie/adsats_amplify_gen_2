import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'flight_crew_record_categories/route.dart';

class RolesShellBranchData extends StatefulShellBranchData {
  const RolesShellBranchData();
  static const branch = TypedStatefulShellBranch<RolesShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      RolesRoute.route,
    ],
  );
}

class RolesRoute extends RouteInfo with $RolesRoute {
  const RolesRoute();

  static const route = TypedGoRoute<RolesRoute>(
      path: '/admin/roles',
      name: 'Roles',
      routes: <TypedRoute<RouteData>>[FlightCrewRecordsCategoriesRoute.route]);

  @override
  Icon get icon => const Icon(Icons.groups_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.groups);
  @override
  String get label => 'Roles';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: RolesPage());
  }
}
