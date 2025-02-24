import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class AircraftShellBranchData extends StatefulShellBranchData {
  const AircraftShellBranchData();
}

class AircraftRoute extends RouteInfo {
  const AircraftRoute();

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
