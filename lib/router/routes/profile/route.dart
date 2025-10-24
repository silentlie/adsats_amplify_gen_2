import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'change_password/route.dart';
export 'records/route.dart';
export 'home/route.dart';

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
