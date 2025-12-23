import 'package:adsats_amplify_gen_2/pages/main/shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'create/route.dart';
export 'notice/route.dart';
export 'notices/route.dart';

class SMSShellBranchData extends StatefulShellBranchData {
  static String $initialLocation = SmsAllRoute().location;
  const SMSShellBranchData();
  static const branch = TypedStatefulShellBranch<SMSShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SMSRoute.route,
    ],
  );
}

class SMSRoute extends RouteInfo with $SMSRoute {
  const SMSRoute();

  static const route = TypedGoRoute<SMSRoute>(
    path: '/sms',
    name: 'SMS',
    routes: <TypedRoute<RouteData>>[
      SmsShellRouteData.route,
      CreateNoticeShellRouteData.route,
      ViewNoticeRoute.route
    ],
  );

  @override
  Icon get icon => const Icon(Icons.support_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.support);
  @override
  String get label => 'S.M.S';

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    // Only redirect if the exact path is /sms (not child routes)
    if (state.uri.path == '/sms') {
      return SmsAllRoute().location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SMSPage();
  }
}
