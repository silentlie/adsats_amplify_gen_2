part of '../../route.dart';

class SMSShellBranchData extends StatefulShellBranchData {
  static String $initialLocation = SmsInboxRoute().location;
  const SMSShellBranchData();
  static const branch = TypedStatefulShellBranch<SMSShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SMSRoute.route,
    ],
  );
}

class SMSRoute extends RouteInfo with _$SMSRoute {
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
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SMSPage());
  }
}
