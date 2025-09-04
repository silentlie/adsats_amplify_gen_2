import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileRecordsBranchData extends StatefulShellBranchData {
  const ProfileRecordsBranchData();
  static const branch = TypedStatefulShellBranch<ProfileRecordsBranchData>(
    routes: <TypedRoute<RouteData>>[
      ProfileRecordsRoute.route,
    ],
  );
}

class ProfileRecordsRoute extends RouteInfo with $ProfileRecordsRoute {
  const ProfileRecordsRoute();

  static const route = TypedGoRoute<ProfileRecordsRoute>(
    path: '/profile/records',
    name: 'Profile Records',
  );

  @override
  Icon get icon => const Icon(Icons.contact_page_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.contact_page);
  @override
  String get label => 'Profile Records';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ProfileRecordsPage());
  }
}
