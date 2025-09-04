import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShellBranchData extends StatefulShellBranchData {
  static const branch = TypedStatefulShellBranch<HomeShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      HomeRoute.route,
    ],
  );
  const HomeShellBranchData();
}

class HomeRoute extends RouteInfo with $HomeRoute {
  const HomeRoute();

  static const route = TypedGoRoute<HomeRoute>(
    path: '/',
    name: 'Home',
  );

  @override
  Icon get icon => const Icon(Icons.home_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.home);
  @override
  String get label => 'Home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HomePage());
  }
}
