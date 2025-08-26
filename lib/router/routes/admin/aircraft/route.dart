part of '../../route.dart';

class AircraftShellBranchData extends StatefulShellBranchData {
  const AircraftShellBranchData();
  static const branch = TypedStatefulShellBranch<AircraftShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      AircraftRoute.route,
    ],
  );
}

class AircraftRoute extends RouteInfo with _$AircraftRoute {
  const AircraftRoute();

  static const route = TypedGoRoute<AircraftRoute>(
    path: '/admin/aircraft',
    name: 'Aircraft',
  );

  @override
  Icon get icon => const Icon(Icons.airlines_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.airlines);
  @override
  String get label => 'Aircraft';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: AircraftPage());
  }
}
