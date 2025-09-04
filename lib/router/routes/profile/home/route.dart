
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();
  static const branch = TypedStatefulShellBranch<ProfileBranchData>(
    routes: <TypedRoute<RouteData>>[
      ProfileRoute.route,
    ],
  );
}

class ProfileRoute extends RouteInfo with $ProfileRoute {
  const ProfileRoute();

  static const route = TypedGoRoute<ProfileRoute>(
    path: '/profile',
    name: 'Profile',
  );

  @override
  Icon get icon => const Icon(Icons.account_circle_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.account_circle);
  @override
  String get label => 'Profile';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ProfileHomePage());
  }
}
