import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/create_report/internal_audit_report/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/create_report/external_audit_report/route.dart';



class CreateReportShellRouteData extends StatefulShellRouteInfo {
  const CreateReportShellRouteData();

  static String $initialLocation = InternalAuditReportRoute().location;

  //
  @override
  Icon get icon => const Icon(Icons.add_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.add);
  @override
  String get label => 'Create Report';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: CreateReportShell(navigationShell: navigationShell),
    );
  }
}

class CreateReportShell extends StatelessWidget {
  const CreateReportShell({
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
    InternalAuditReportRoute(),
    ExternalAuditReportRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationBar(
          destinations: routes.map(
            (routeInfo) {
              return NavigationDestination(
                icon: routeInfo.icon,
                label: routeInfo.label,
                selectedIcon: routeInfo.selectedIcon,
              );
            },
          ).toList(),
          onDestinationSelected: onDestinationSelected,
          selectedIndex: navigationShell.currentIndex,
        ),
        Expanded(child: navigationShell),
      ],
    );
  }
}
