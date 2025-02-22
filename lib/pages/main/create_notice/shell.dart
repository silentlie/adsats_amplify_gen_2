import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/create_notice/notice_to_crew/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/create_notice/safety_notice/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/create_notice/hazard_report/route.dart';

class CreateNoticeShellRouteData extends StatefulShellRouteInfo {
  const CreateNoticeShellRouteData();

  static String $initialLocation = NoticeToCrewRoute().location;

  @override
  Icon get icon => const Icon(Icons.add_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.add);
  @override
  String get label => 'Create Notice';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: CreateNoticeShell(navigationShell: navigationShell),
    );
  }
}

class CreateNoticeShell extends StatelessWidget {
  const CreateNoticeShell({super.key,
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
    NoticeToCrewRoute(),
    SafetyNoticeRoute(),
    HazardReportRoute(),
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
