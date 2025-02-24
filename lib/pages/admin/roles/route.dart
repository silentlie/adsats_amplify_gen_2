import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class RolesShellBranchData extends StatefulShellBranchData {
  const RolesShellBranchData();
}

class RolesRoute extends RouteInfo {
  const RolesRoute();

  @override
  Icon get icon => const Icon(Icons.group_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.group);
  @override
  String get label => 'Roles';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: RolesPage());
  }
}
