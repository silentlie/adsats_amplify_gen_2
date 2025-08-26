part of '../../route.dart';

class CmsShellBranchData extends StatefulShellBranchData {
  static String $initialLocation = CmsSentRoute().location;
  const CmsShellBranchData();
  static const branch = TypedStatefulShellBranch<CmsShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      CmsRoute.route,
    ],
  );
}

class CmsRoute extends RouteInfo with _$CmsRoute {
  const CmsRoute();
  static const route = TypedGoRoute<CmsRoute>(
    path: '/cms',
    name: 'CMS',
    routes: <TypedRoute<RouteData>>[
      CmsShellRouteData.route,
      CreateReportShellRouteData.route,
      ViewReportRoute.route,
    ],
  );

  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'C.M.S';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CmsPage());
  }
}
