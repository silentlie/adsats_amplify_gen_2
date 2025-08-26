part of '../../../../route.dart';

class SmsSentShellBranchData extends StatefulShellBranchData {
  const SmsSentShellBranchData();
  static const branch = TypedStatefulShellBranch<SmsSentShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SmsSentRoute.route,
    ],
  );
}

class SmsSentRoute extends RouteInfo with _$SmsSentRoute {
  const SmsSentRoute();
  static const route = TypedGoRoute<SmsSentRoute>(
    path: 'sent',
    name: 'SMS Sent',
  );

  @override
  Icon get icon => const Icon(Icons.outbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.outbox);
  @override
  String get label => 'Sent';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SmsSentPage());
  }
}
