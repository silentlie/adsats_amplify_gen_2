part of '../../route.dart';

class ChangePasswordBranchData extends StatefulShellBranchData {
  const ChangePasswordBranchData();
  static const branch = TypedStatefulShellBranch<ChangePasswordBranchData>(
    routes: <TypedRoute<RouteData>>[
      ChangePasswordRoute.route,
    ],
  );
}

class ChangePasswordRoute extends RouteInfo with _$ChangePasswordRoute {
  const ChangePasswordRoute();

  static const route = TypedGoRoute<ChangePasswordRoute>(
    path: '/profile/change-password',
    name: 'Change Password',
  );

  @override
  Icon get icon => const Icon(Icons.password_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.password);
  @override
  String get label => 'Change Password';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ChangePasswordPage());
  }
}
