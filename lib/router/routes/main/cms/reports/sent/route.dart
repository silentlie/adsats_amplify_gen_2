part of '../../../../route.dart';

class CmsSentShellBranchData extends StatefulShellBranchData {
  const CmsSentShellBranchData();
  static const branch = TypedStatefulShellBranch<CmsSentShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      CmsSentRoute.route,
    ],
  );
}

class CmsSentRoute extends RouteInfo with _$CmsSentRoute {
  const CmsSentRoute();
  static const route = TypedGoRoute<CmsSentRoute>(
    path: 'sent',
    name: 'CMS Sent',
  );

  @override
  Icon get icon => const Icon(Icons.outbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.outbox);
  @override
  String get label => 'Sent';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CmsSentPage());
  }
}
