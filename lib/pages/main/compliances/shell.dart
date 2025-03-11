import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/compliances/inbox/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/compliances/sent/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/compliances/create_report/shell.dart';

class ComplianceShellBranchData extends StatefulShellBranchData {
  const ComplianceShellBranchData();
}

class ComplianceShellRouteData extends StatefulShellRouteInfo {
  const ComplianceShellRouteData();

  static String $initialLocation = ComplianceInboxRoute().location;

  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'Compliance';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: ComplianceShell(navigationShell: navigationShell),
    );
  }
}

class ComplianceShell extends StatelessWidget {
  const ComplianceShell({
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
    ComplianceInboxRoute(),
    ComplianceSentRoute(),
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
