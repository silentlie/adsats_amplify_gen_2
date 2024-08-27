import 'package:adsats_amplify_gen_2/default_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: AppBar(
        backgroundColor: colorScheme.secondary.withOpacity(0.3),
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: const DefaultLogoWidget(),
        ),
        elevation: 20,
        titleSpacing: 0,
        leadingWidth: 81,
        title: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: MenuItemRow(menuItems: AppBarItems.fullMenuItems),
        ),
        centerTitle: true,
        actions: [
          // const ThemeSwitch(),
          // const NotificationWidget(),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemRow extends StatelessWidget {
  const MenuItemRow({super.key, required this.menuItems});

  final List<MenuItem> menuItems;

  final double appbarBoxSize = 8.0;
  final double appbarIconSize = 20.0;
  final double appbarFontSize = 16.0;
  final double wrapSpacing = 30.0;
  final double runSpacing = 10.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    String currentUri = GoRouterState.of(context).uri.toString();

    return Row(
      children: menuItems.map((item) {
        return TextButton.icon(
          onPressed: () {
            currentUri != item.route ? context.go(item.route) : null;
          },
          label: Text(
            item.text,
            style: TextStyle(
              fontSize: appbarFontSize,
              color: colorScheme.primary,
            ),
          ),
          icon: Icon(
            item.icon,
            size: appbarIconSize,
            color: colorScheme.primary,
          ),
          style: ButtonStyle(
            // todo: Need to check for cosmetic
            backgroundColor: WidgetStateProperty.all(
              currentUri == item.route
                  ? colorScheme.primaryContainer.withOpacity(0.25)
                  : Colors.transparent,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;
  final String route;

  // Constructor
  const MenuItem({required this.text, required this.icon, required this.route});

  String get getRoute {
    return route;
  }
}

class AppBarItems {
  static const List<MenuItem> fullMenuItems = [
    itemDocuments,
    itemSMS,
    itemCompliance,
    itemTraining,
  ];

  static const List<MenuItem> tabletMenuItems = [
    itemDocuments,
    itemSMS,
  ];

  static const List<MenuItem> tabletPopupItems = [
    itemCompliance,
    itemTraining,
  ];

  static const itemDocuments = MenuItem(
      text: 'Documents', icon: Icons.insert_drive_file, route: '/documents');
  static const itemSMS = MenuItem(
      text: 'S.M.S', icon: FontAwesomeIcons.helmetSafety, route: '/sms');
  static const itemCompliance = MenuItem(
      text: 'Compliance',
      icon: Icons.assignment_turned_in,
      route: '/compliance');
  static const itemTraining = MenuItem(
      text: 'Training',
      icon: FontAwesomeIcons.graduationCap,
      route: '/training');
}
