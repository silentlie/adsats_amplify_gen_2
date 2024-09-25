import 'package:adsats_amplify_gen_2/models/Notice.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/hazard_report/hazard_report_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_to_crew/notice_to_crew_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/safety_notice/safety_notice_widget.dart';
import 'package:flutter/material.dart';

class NoticeWidget extends StatefulWidget {
  const NoticeWidget({super.key, this.notice});
  final Notice? notice;

  @override
  State<NoticeWidget> createState() => _NoticeWidgetState();
}

class _NoticeWidgetState extends State<NoticeWidget> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const NoticeToCrewWidget(),
    const SafetyNoticeWidget(),
    const HazardReportWidget(),
  ];
  final List<NavigationDestination> _navigationDestinations = [
    const NavigationDestination(
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications),
      label: "Notice to Crew",
    ),
    const NavigationDestination(
      icon: Icon(Icons.gpp_maybe_outlined),
      selectedIcon: Icon(Icons.gpp_maybe),
      label: "Safety Notice",
    ),
    const NavigationDestination(
      icon: Icon(Icons.report_outlined),
      selectedIcon: Icon(Icons.report),
      label: "Hazard Report",
    ),
    // const NavigationDestination(
    //   icon: Icon(Icons.document_scanner_outlined),
    //   selectedIcon: Icon(Icons.document_scanner),
    //   label: "BCAA report",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1533) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1532),
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: _pages,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: NavigationBar(
                  onDestinationSelected: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  destinations: _navigationDestinations,
                  selectedIndex: _selectedIndex,
                  elevation: 10,
                ),
              ),
            ],
          );
        }
        return Row(
          children: [
            SafeArea(
              child: Container(
                alignment: Alignment.center,
                width: 175,
                child: NavigationRail(
                  onDestinationSelected: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  destinations: _navigationDestinations.map((destination) {
                    return NavigationRailDestination(
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                      label: Text(destination.label),
                    );
                  }).toList(),
                  selectedIndex: _selectedIndex,
                  elevation: 10,
                  extended: constraints.maxWidth >= 1533,
                  minWidth: 72,
                  labelType: NavigationRailLabelType.none,
                  useIndicator: true,
                ),
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1500),
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _pages,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
