import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AircraftShellBranchData extends StatefulShellBranchData {
  const AircraftShellBranchData();
  static const branch = TypedStatefulShellBranch<AircraftShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      AircraftRoute.route,
    ],
  );
}

class AircraftRoute extends RouteInfo with $AircraftRoute {
  const AircraftRoute();

  static const route = TypedGoRoute<AircraftRoute>(
    path: '/admin/aircraft',
    name: 'Aircraft',
  );

  @override
  Icon get icon => const Icon(Icons.airlines_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.airlines);
  @override
  String get label => 'Aircraft';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: AircraftPage());
  }
}
