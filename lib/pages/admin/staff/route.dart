import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class StaffShellBranchData extends StatefulShellBranchData {
  const StaffShellBranchData();
}

class StaffRoute extends RouteInfo {
  const StaffRoute();

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
