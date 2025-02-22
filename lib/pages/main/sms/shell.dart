import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/sms/inbox/route.dart';
export 'package:adsats_amplify_gen_2/pages/main/sms/sent/route.dart';

class SmsShellBranchData extends StatefulShellBranchData {
  const SmsShellBranchData();
}

class SmsShellRouteData extends StatefulShellRouteInfo {
  const SmsShellRouteData();

  static String $initialLocation = '/sms/sent';

  //TODO: fix icon
  @override
  Icon get icon => const Icon(Icons.insert_drive_file_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.insert_drive_file);
  @override
  String get label => 'S.M.S';

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      child: SmsShell(navigationShell: navigationShell),
    );
  }
}

class SmsShell extends StatelessWidget {
  const SmsShell({
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
    SmsInboxRoute(),
    SmsSentRoute(),
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
