import 'package:adsats_amplify_gen_2/pages/main/create_report/internal_audit_report/route.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/settings/settings.dart';
import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/home/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/documents/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/sms/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/create_notice/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/compliances/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/create_report/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/crew_documents/route.dart';

class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  static String $initialLocation = HomeRoute().location;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainShell(
      navigationShell: navigationShell,
    );
  }
}

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

  final List<RouteInfoBase> routes = const [
    HomeRoute(),
    DocumentsRoute(),
    SmsShellRouteData(),
    ComplianceShellRouteData(),
    CrewDocumentsRoute(),
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
          leading: IconButton(
            onPressed: () {
              ref
                  .read(settingsNotifierProvider.notifier)
                  .changeNavigationRailExtended();
            },
            icon: Icon(
              isExtended ? Icons.chevron_left : Icons.chevron_right,
            ),
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
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: onDestinationSelected,
          groupAlignment: -1,
          extended: isExtended,
          labelType: isExtended ? null : NavigationRailLabelType.selected,
          minExtendedWidth: 192,
          trailing: IconButton(
            onPressed: () => Amplify.Auth.signOut(),
            icon: Icon(
              Icons.logout,
            ),
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
        selectedIndex: navigationShell.currentIndex,
      ),
    );
  }

  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    final currentPath = GoRouter.of(context).state.uri.path;
    final actions = <String, (String, VoidCallback)>{
      DocumentsRoute().location: (
        "New Document",
        () {
          // TODO: Upload new documents
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
      ComplianceInboxRoute().location: (
        "New Report",
        () => InternalAuditReportRoute().push(context)
      ),
      ComplianceSentRoute().location: (
        "New Report",
        () => InternalAuditReportRoute().push(context)
      ),
      CrewDocumentsRoute().location: (
        "New Crew Documents",
        () {
          // TODO: Upload new crew documents
        }
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
    if (currentPath != HomeRoute().location) {
      return _buildFAB(
        isLandscape: isLandscape,
        label: "Back",
        icon: Icons.arrow_back,
        onPressed:
            context.canPop() ? context.pop : () => HomeRoute().go(context),
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
      return FloatingActionButtonLocation.endFloat;
    }
    return FloatingActionButtonLocation.centerFloat;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBar = bottomAppBar(context);
    final button = floatingActionButton(context, ref);
    final location = button == null ? null : floatButtonLocation(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: body(context, ref),
      endDrawer: null,
      primary: true,
      floatingActionButton: button,
      floatingActionButtonLocation: location,
      bottomNavigationBar: bottomBar,
    );
  }
}
