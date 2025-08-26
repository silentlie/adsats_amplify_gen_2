part of '../../route.dart';

class KPIShellBranchData extends StatefulShellBranchData {
  const KPIShellBranchData();
  static const branch = TypedStatefulShellBranch<KPIShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      KPIRoute.route,
    ],
  );
}

class KPIRoute extends RouteInfo with _$KPIRoute {
  const KPIRoute();

  static const route = TypedGoRoute<KPIRoute>(
    path: '/kpi',
    name: 'K.P.I',
  );

  @override
  Icon get icon => const Icon(Icons.onetwothree_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.onetwothree);
  @override
  String get label => 'K.P.I';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: KPIPage());
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final ref = ProviderScope.containerOf(context);
    final isAdmin = ref.read(isAdminProvider);
    if (isAdmin) return null;
    return HomeRoute().location;
  }
}
