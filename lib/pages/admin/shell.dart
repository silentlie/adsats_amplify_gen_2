import 'package:adsats_amplify_gen_2/pages/admin/aircraft/widgets/aircraft.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/widgets/category_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/subcategory.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/widgets/crew_document_category_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/widgets/role.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/widgets/staff.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/settings/settings.dart';
import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'aircraft/page.dart';
export 'categories/page.dart';
export 'roles/page.dart';
export 'staff/page.dart';

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
    final isExtended = ref.watch(settingsProvider.select(
      (value) => value.value?.isNavigationRailExtended ?? false,
    ));
    return Row(
      children: [
        NavigationRail(
          leading: TextButton.icon(
            onPressed: () {
              ref
                  .read(settingsProvider.notifier)
                  .toggleNavigationRailExtended();
            },
            label: isExtended ? Text("Collapse") : Icon(Icons.chevron_right),
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
        "New Flight Crew Records Category",
        () {
          showDialog(
            context: context,
            builder: (context) {
              return FlightCrewRecordsCategoryView(
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
