part of '../../route.dart';

class HomeShellBranchData extends StatefulShellBranchData {
  static const branch = TypedStatefulShellBranch<HomeShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      HomeRoute.route,
    ],
  );
  const HomeShellBranchData();
}

class HomeRoute extends RouteInfo with _$HomeRoute {
  const HomeRoute();

  static const route = TypedGoRoute<HomeRoute>(
    path: '/',
    name: 'Home',
  );

  @override
  Icon get icon => const Icon(Icons.home_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.home);
  @override
  String get label => 'Home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HomePage());
  }
}
