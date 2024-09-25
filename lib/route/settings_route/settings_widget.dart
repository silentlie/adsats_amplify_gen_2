import 'package:adsats_amplify_gen_2/route/settings_route/Aircraft/aircraft_widget.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Categories/categories_widget.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Roles/roles_widget.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Staff/staff_widget.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Subcategories/subcategories_widget.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AircraftDataTable2(),
    const RolesDataTable2(),
    const StaffDataTable2(),
    const CategoriesDataTable2(),
    const SubcategoriesDataTable2(),
  ];

  final List<NavigationDestination> _navigationDestinations = [
    const NavigationDestination(
      icon: Icon(Icons.airlines_outlined),
      selectedIcon: Icon(Icons.airlines),
      label: "Aircraft",
    ),
    const NavigationDestination(
      icon: Icon(Icons.groups_outlined),
      selectedIcon: Icon(Icons.groups),
      label: "Roles",
    ),
    const NavigationDestination(
      icon: Icon(Icons.group_outlined),
      selectedIcon: Icon(Icons.group),
      label: "Staff",
    ),
    const NavigationDestination(
      icon: Icon(Icons.view_agenda_outlined),
      selectedIcon: Icon(Icons.view_agenda),
      label: "Categories",
    ),
    const NavigationDestination(
      icon: Icon(Icons.view_list_outlined),
      selectedIcon: Icon(Icons.view_list),
      label: "Subcategories",
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
                    child:  IndexedStack(
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
