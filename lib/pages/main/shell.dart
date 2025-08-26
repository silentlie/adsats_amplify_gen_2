import 'package:adsats_amplify_gen_2/pages/main/documents/new_document.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/settings/settings.dart';
import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'home/page.dart';
export 'profile/page.dart';
export 'documents/page.dart';
export 'flight_crew_records/page.dart';
export 'help/page.dart';
export 'kpi/page.dart';
export 'sms/page.dart';
export 'cms/page.dart';

class MainShell extends ConsumerWidget {
  const MainShell({
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
    HomeRoute(),
    DocumentsRoute(),
    SmsShellRouteData(),
    CmsShellRouteData(),
    FlightCrewRecordsRoute(),
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
          minExtendedWidth: 205,
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
    final currentPath = GoRouter.of(context).state.uri.path;
    final actions = <String, (String, VoidCallback)>{
      DocumentsRoute().location: (
        "New Document",
        () {
          showDialog(
            context: context,
            builder: (context) => NewDocumentDialog(),
          );
        }
      ),
      SmsInboxRoute().location: (
        "New Notice",
        () => NoticeToCrewRoute().push(context)
      ),
      SmsSentRoute().location: (
        "New Notice",
        () => NoticeToCrewRoute().push(context)
      ),
      CmsInboxRoute().location: (
        "New Report",
        () => InternalAuditReportRoute().push(context)
      ),
      CmsSentRoute().location: (
        "New Report",
        () => InternalAuditReportRoute().push(context)
      ),
    };
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
    if (isLandscape) {
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
