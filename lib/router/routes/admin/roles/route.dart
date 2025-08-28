part of '../../route.dart';

class RolesShellBranchData extends StatefulShellBranchData {
  const RolesShellBranchData();
  static const branch = TypedStatefulShellBranch<RolesShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      RolesRoute.route,
    ],
  );
}

class RolesRoute extends RouteInfo with _$RolesRoute {
  const RolesRoute();

  static const route = TypedGoRoute<RolesRoute>(
      path: '/admin/roles',
      name: 'Roles',
      routes: <TypedRoute<RouteData>>[FlightCrewRecordsCategoriesRoute.route]);

  @override
  Icon get icon => const Icon(Icons.groups_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.groups);
  @override
  String get label => 'Roles';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: RolesPage());
  }
}
