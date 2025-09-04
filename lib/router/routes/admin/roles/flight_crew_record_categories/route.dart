import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlightCrewRecordsCategoriesRoute extends RouteInfo
    with $FlightCrewRecordsCategoriesRoute {
  const FlightCrewRecordsCategoriesRoute({required this.roleId});
  static const route = TypedGoRoute<FlightCrewRecordsCategoriesRoute>(
    path: ':roleId',
    name: 'Flight Crew Records Categories',
  );
  final String roleId;

  @override
  Icon get icon => const Icon(Icons.view_agenda_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.view_agenda);
  @override
  String get label => 'Flight Crew Records Categories';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: FlightCrewRecordsCategoriesPage(
      roleId: roleId,
    ));
  }
}
