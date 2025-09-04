import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'aircraft/route.dart';
export 'categories/route.dart';
export 'roles/route.dart';
export 'staff/route.dart';

class AdminShellRouteData extends StatefulShellRouteInfo {
  const AdminShellRouteData();
  static const route = TypedStatefulShellRoute<AdminShellRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      AircraftShellBranchData.branch,
      RolesShellBranchData.branch,
      StaffShellBranchData.branch,
      CategoriesShellBranchData.branch,
    ],
  );
  static String $initialLocation = AircraftRoute().location;

  @override
  Icon get icon => const Icon(Icons.admin_panel_settings_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.admin_panel_settings);
  @override
  String get label => 'Admin';

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AdminShell(
      navigationShell: navigationShell,
    );
  }

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final ref = ProviderScope.containerOf(context);
    final isAdmin = ref.read(isAdminProvider);
    if (isAdmin) return null;
    return HomeRoute().location;
  }
}
