import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
}

class ProfileRoute extends RouteInfo {
  const ProfileRoute();

  @override
  Icon get icon => const Icon(Icons.account_circle_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.account_circle);
  @override
  String get label => 'Profile';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ProfilePage());
  }
}
