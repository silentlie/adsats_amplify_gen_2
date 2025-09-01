import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'internal/page.dart';
export 'external/page.dart';

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
        Expanded(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1536.0),
              child: Card(
                child: SingleChildScrollView(
                  child: navigationShell,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
