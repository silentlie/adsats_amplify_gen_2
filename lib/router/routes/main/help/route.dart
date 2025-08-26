part of '../../route.dart';

class HelpShellBranchData extends StatefulShellBranchData {
  const HelpShellBranchData();
  static const branch = TypedStatefulShellBranch<HelpShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      HelpRoute.route,
    ],
  );
}

class HelpRoute extends RouteInfo with _$HelpRoute {
  const HelpRoute();

  static const route = TypedGoRoute<HelpRoute>(
    path: '/help',
    name: 'Help',
  );

  @override
  Icon get icon => const Icon(Icons.help_outline);
  @override
  Icon get selectedIcon => const Icon(Icons.help);
  @override
  String get label => 'Help';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HelpPage());
  }
}
