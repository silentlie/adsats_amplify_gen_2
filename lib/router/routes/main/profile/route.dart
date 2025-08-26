part of '../../route.dart';

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
  static const branch = TypedStatefulShellBranch<ProfileShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      ProfileRoute.route,
    ],
  );
}

class ProfileRoute extends RouteInfo with _$ProfileRoute {
  const ProfileRoute();

  static const route = TypedGoRoute<ProfileRoute>(
    path: '/profile',
    name: 'Profile',
  );

  @override
  Icon get icon => const Icon(Icons.account_circle_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.account_circle);
  @override
  String get label => 'Profile';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ProfilePage());
  }
}
