import 'dart:async';

import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/aircraft_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/category_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/subcategory_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/crew_document_category_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/role_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/staff_view.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/settings/settings.dart';
import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/admin/aircraft/route.dart';
export 'package:adsats_amplify_gen_2/pages/admin/roles/route.dart';
export 'package:adsats_amplify_gen_2/pages/admin/staff/route.dart';
export 'package:adsats_amplify_gen_2/pages/admin/categories/route.dart';

class AdminShellRouteData extends StatefulShellRouteInfo {
  const AdminShellRouteData();

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
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final ref = ProviderScope.containerOf(context);
    final user = await ref.read(userDetailsProvider.future);
    final isAdmin = user.roles?.any(
          (role) {
            return role.role?.name == "Admin";
          },
        ) ??
        false;
    if (isAdmin) return null;
    print("return home");
    return HomeRoute().location;
  }
}

class AdminShell extends ConsumerWidget {
  const AdminShell({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  void onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  int? validIndex() {
    if (0 <= navigationShell.currentIndex &&
        navigationShell.currentIndex < routes.length) {
      return navigationShell.currentIndex;
    }
    return null;
  }

  final List<RouteInfoBase> routes = const [
    AircraftRoute(),
    RolesRoute(),
    StaffRoute(),
    CategoriesRoute(),
  ];

  Widget body(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    if (!isLandscape) return navigationShell;
    final isExtended = ref.watch(settingsNotifierProvider.select(
      (value) => value.isNavigationRailExtended,
    ));
    return Row(
      children: [
        NavigationRail(
          leading: TextButton.icon(
            onPressed: () {
              ref
                  .read(settingsNotifierProvider.notifier)
                  .changeNavigationRailExtended();
            },
            label: isExtended ? Text("Colapse") : Icon(Icons.chevron_right),
            icon: isExtended ? Icon(Icons.chevron_left) : null,
          ),
          destinations: routes.map(
            (route) {
              return NavigationRailDestination(
                icon: route.icon,
                label: Text(route.label),
                selectedIcon: route.selectedIcon,
              );
            },
          ).toList(),
          selectedIndex: validIndex(),
          onDestinationSelected: onDestinationSelected,
          groupAlignment: -1,
          extended: isExtended,
          labelType: isExtended ? null : NavigationRailLabelType.selected,
          minExtendedWidth: 192,
          trailing: TextButton.icon(
            onPressed: () {
              context.canPop() ? context.pop() : HomeRoute().go(context);
            },
            label: isExtended ? Text("Back") : Icon(Icons.arrow_back),
            icon: isExtended ? Icon(Icons.arrow_back) : null,
          ),
        ),
        VerticalDivider(
          width: 0,
          thickness: 1,
        ),
        Expanded(child: navigationShell),
      ],
    );
  }

  BottomAppBar? bottomAppBar(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    if (isLandscape) return null;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: NavigationBar(
        destinations: routes.map(
          (routeInfo) {
            return NavigationDestination(
              icon: routeInfo.icon,
              label: routeInfo.label,
              selectedIcon: routeInfo.selectedIcon,
              tooltip: routeInfo.label,
            );
          },
        ).toList(),
        onDestinationSelected: onDestinationSelected,
        selectedIndex: validIndex() ?? 0,
      ),
    );
  }

  FloatingActionButton? floatingActionButton(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    final goRouterState = GoRouter.of(context).state;
    final currentPath = goRouterState.uri.path;
    final actions = <String, (String, VoidCallback)>{
      AircraftRoute().location: (
        "New Aircraft",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return AircraftView();
            },
          );
        }
      ),
      RolesRoute().location: (
        "New Role",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return RoleView();
            },
          );
        }
      ),
      StaffRoute().location: (
        "New Staff",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return StaffView();
            },
          );
        }
      ),
      CategoriesRoute().location: (
        "New Category",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return CategoryView();
            },
          );
        }
      ),
    };
    if (goRouterState.pathParameters.containsKey('categoryId')) {
      actions[currentPath] = (
        "New Subcategory",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return SubcategoryView(
                categoryId: goRouterState.pathParameters['categoryId']!,
              );
            },
          );
        }
      );
    } else if (goRouterState.pathParameters.containsKey('roleId')) {
      actions[currentPath] = (
        "New Crew Document Category",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return CrewDocumentCategoryView(
                roleId: goRouterState.pathParameters['roleId']!,
              );
            },
          );
        }
      );
    }
    final action = actions[currentPath];

    if (action != null) {
      final (label, onPressed) = action;
      return _buildFAB(
        isLandscape: isLandscape,
        label: label,
        onPressed: onPressed,
      );
    }
    return null;
  }

  FloatingActionButton _buildFAB({
    required bool isLandscape,
    required String label,
    required VoidCallback onPressed,
    IconData icon = Icons.add,
  }) {
    return isLandscape
        ? FloatingActionButton.extended(
            onPressed: onPressed,
            label: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(label),
              ],
            ),
            tooltip: label,
          )
        : FloatingActionButton(
            onPressed: onPressed,
            tooltip: label,
            child: Icon(icon),
          );
  }

  FloatingActionButtonLocation floatButtonLocation(
    BuildContext context,
  ) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    if (!isLandscape) {
      return FloatingActionButtonLocation.centerFloat;
    }
    return FloatingActionButtonLocation.centerFloat;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBar = bottomAppBar(context);
    final location = floatButtonLocation(context);
    final button = floatingActionButton(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: body(context, ref),
      endDrawer: DrawerWidget(),
      primary: true,
      floatingActionButtonLocation: location,
      floatingActionButton: button,
      bottomNavigationBar: bottomBar,
    );
  }
}
