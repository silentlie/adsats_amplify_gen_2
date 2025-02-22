import 'package:adsats_amplify_gen_2/theme/theme_toggle_button.dart';
import 'package:adsats_amplify_gen_2/widgets/default_logo_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colorScheme.secondary.withValues(alpha: 0.3),
      leading: Container(
        padding: const EdgeInsets.all(2),
        child: const DefaultLogoWidget(),
      ),
      leadingWidth: 94,
      title: title(context),
      centerTitle: true,
      actions: [
        ThemeToggleButton(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        )
      ],
    );
  }

  Text title(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    return Text(
      isLandscape
          ? "ADSATS - Aviation Document Storage and Tracking System"
          : "ADSATS",
    );
  }
}
