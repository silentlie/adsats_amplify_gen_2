part of '../../../../route.dart';

class SmsInboxShellBranchData extends StatefulShellBranchData {
  const SmsInboxShellBranchData();
  static const branch = TypedStatefulShellBranch<SmsInboxShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SmsInboxRoute.route,
    ],
  );
}

class SmsInboxRoute extends RouteInfo with _$SmsInboxRoute {
  const SmsInboxRoute();
  static const route = TypedGoRoute<SmsInboxRoute>(
    path: 'inbox',
    name: 'SMS Inbox',
  );

  @override
  Icon get icon => const Icon(Icons.inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.inbox);
  @override
  String get label => 'Inbox';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SmsInboxPage());
  }
}
