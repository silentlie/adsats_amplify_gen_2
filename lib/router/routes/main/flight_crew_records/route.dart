part of '../../route.dart';

class FlightCrewRecordsShellBranchData extends StatefulShellBranchData {
  const FlightCrewRecordsShellBranchData();
  static const branch =
      TypedStatefulShellBranch<FlightCrewRecordsShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      FlightCrewRecordsRoute.route,
    ],
  );
}

class FlightCrewRecordsRoute extends RouteInfo with _$FlightCrewRecordsRoute {
  const FlightCrewRecordsRoute();

  static const route = TypedGoRoute<FlightCrewRecordsRoute>(
    path: '/flight-crew-records',
    name: 'Flight Crew Records',
  );

  @override
  Icon get icon => const Icon(Icons.contact_page_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.contact_page);
  @override
  String get label => 'Flight Crew Records';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: FlightCrewRecordsPage());
  }
}
