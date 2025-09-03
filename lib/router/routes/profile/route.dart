part of '../route.dart';

class ProfileShellRouteData extends StatefulShellRouteData {
  const ProfileShellRouteData();
  static const route = TypedStatefulShellRoute<ProfileShellRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      ProfileBranchData.branch,
      ChangePasswordBranchData.branch,
      ProfileRecordsBranchData.branch,
    ],
  );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ProfileShell(
      navigationShell: navigationShell,
    );
  }
}
