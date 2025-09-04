import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeToCrewShellBranchData extends StatefulShellBranchData {
  const NoticeToCrewShellBranchData();
  static const branch = TypedStatefulShellBranch<NoticeToCrewShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      NoticeToCrewRoute.route,
    ],
  );
}

class NoticeToCrewRoute extends RouteInfo with $NoticeToCrewRoute {
  const NoticeToCrewRoute();
  static const route = TypedGoRoute<NoticeToCrewRoute>(
    path: 'notice-to-crew',
    name: 'Notice To Crew',
  );

  @override
  Icon get icon => const Icon(Icons.notifications_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.notifications);
  @override
  String get label => 'Notice To Crew';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: NoticeToCrewPage());
  }
}
