import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'notice_to_crew/page.dart';
export 'safety_notice/page.dart';
export 'hazard_report/page.dart';

class CreateNoticeShell extends StatelessWidget {
  const CreateNoticeShell({
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
    SafetyNoticeRoute(),
    HazardReportRoute(),
    NoticeToCrewRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    print(navigationShell.currentIndex);
    return Column(
      children: [
        NavigationBar(
          destinations: [
            NavigationDestination(
              icon: SafetyNoticeRoute().icon,
              label: SafetyNoticeRoute().label,
              selectedIcon: SafetyNoticeRoute().selectedIcon,
              tooltip: '''
Safety Notices provide important safety information for Pilots, Maintenance Engineers and Cabin Attendants.
They are intended to highlight potential safety risks and are generally operational or technical, in content.''',
            ),
            NavigationDestination(
              icon: HazardReportRoute().icon,
              label: HazardReportRoute().label,
              selectedIcon: HazardReportRoute().selectedIcon,
              tooltip: '''
A proactive or reactive, operational (flight or ground),
or maintenance event with the potential to cause or contribute to an aircraft incident or accident.''',
            ),
            NavigationDestination(
              icon: NoticeToCrewRoute().icon,
              label: NoticeToCrewRoute().label,
              selectedIcon: NoticeToCrewRoute().selectedIcon,
              tooltip: '''
For anything that is not a Safety Notice or Hazard Report.
General flight department administration.''',
            ),
          ],
          onDestinationSelected: onDestinationSelected,
          selectedIndex: navigationShell.currentIndex,
        ),
        Expanded(child: navigationShell),
      ],
    );
  }
}
