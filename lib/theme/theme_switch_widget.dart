import 'package:adsats_amplify_gen_2/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  late bool themeBool = Provider.of<ThemeNotifier>(context).themeBool;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Tooltip(
        message: 'Change theme',
        child: Switch(
          value: themeBool,
          onChanged: (value) {
            setState(() {
              themeBool = value;
              Provider.of<ThemeNotifier>(
                context,
                listen: false,
              ).switchThemeMode();
            });
          },
        ),
      ),
    );
  }
}
