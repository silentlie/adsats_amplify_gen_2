part of '../../../../route.dart';

class SafetyNoticeShellBranchData extends StatefulShellBranchData {
  const SafetyNoticeShellBranchData();
  static const branch = TypedStatefulShellBranch<SafetyNoticeShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      SafetyNoticeRoute.route,
    ],
  );
}

class SafetyNoticeRoute extends RouteInfo with _$SafetyNoticeRoute {
  const SafetyNoticeRoute();
  static const route = TypedGoRoute<SafetyNoticeRoute>(
    path: 'safety-notice',
    name: 'Safety Notice',
  );

  @override
  Icon get icon => const Icon(Icons.gpp_maybe_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.gpp_maybe);
  @override
  String get label => 'Safety Notice';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SafetyNoticePage());
  }
}
