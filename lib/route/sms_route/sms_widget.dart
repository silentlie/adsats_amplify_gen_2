import 'package:adsats_amplify_gen_2/route/sms_route/inbox/inbox_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/outbox/outbox_widget.dart';
import 'package:flutter/material.dart';

class SMSWidget extends StatefulWidget {
  const SMSWidget({super.key});

  @override
  State<SMSWidget> createState() => _SMSWidgetState();
}

class _SMSWidgetState extends State<SMSWidget> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const InboxDataTable2(),
    const OutboxDataTable2(),
  ];

  final List<NavigationDestination> _navigationDestinations = [
    const NavigationDestination(
      icon: Icon(Icons.move_to_inbox_outlined),
      selectedIcon: Icon(Icons.move_to_inbox),
      label: "Inbox",
    ),
    const NavigationDestination(
      icon: Icon(Icons.outbox_outlined),
      selectedIcon: Icon(Icons.outbox),
      label: "Outbox",
    ),
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
                    child: _pages[_selectedIndex],
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
                  child: _pages[_selectedIndex],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
