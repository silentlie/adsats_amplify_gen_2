import 'package:adsats_amplify_gen_2/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(
      settingsNotifierProvider.select((settings) => settings.value?.themeMode ?? ThemeMode.system),
    );
    return IconButton(
      onPressed: () {
        final newThemeMode = switch (themeMode) {
          ThemeMode.light => ThemeMode.system,
          ThemeMode.system => ThemeMode.dark,
          ThemeMode.dark => ThemeMode.light,
        };
        ref
            .read(settingsNotifierProvider.notifier)
            .updateThemeMode(newThemeMode);
      },
      icon: Icon(switch (themeMode) {
        ThemeMode.light => Icons.light_mode_outlined,
        ThemeMode.system => Icons.autorenew_outlined,
        ThemeMode.dark => Icons.dark_mode_outlined,
      }),
      tooltip: 'Switch Theme Mode',
    );
  }
}
