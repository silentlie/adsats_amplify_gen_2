import 'package:adsats_amplify_gen_2/helper/shared_perferences.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings.g.dart';
part 'settings.freezed.dart';

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() {
    final sfAsync = ref.watch(sharedPerferencesProvider);
    return sfAsync.when<Settings>(
      data: (sf) {
        final themeModeStr = sf.getString('themeMode');
        final themeMode = switch (themeModeStr) {
          'light' => ThemeMode.light,
          'dark' => ThemeMode.dark,
          'system' => ThemeMode.system,
          _ => ThemeMode.system,
        };
        final isExtended = sf.getBool('isNavigationRailExtended') ?? false;
        return Settings(
            themeMode: themeMode,
            isNavigationRailExtended: isExtended,);
      },
      error: (error, stackTrace) {
        throw error;
      },
      loading: () => Settings(),
    );
  }

  void updateThemeMode(ThemeMode newThemeMode) {
    if (state.themeMode == newThemeMode) return;
    state = state.copyWith(themeMode: newThemeMode);
    final sfProvider = ref.read(sharedPerferencesProvider.notifier);
    sfProvider.saveData('themeMode', state.themeMode.name);
  }

  void changeNavigationRailExtended() {
    state = state.copyWith(
      isNavigationRailExtended: !state.isNavigationRailExtended,
    );
    final sfProvider = ref.read(sharedPerferencesProvider.notifier);
    sfProvider.saveData(
      'isNavigationRailExtended',
      state.isNavigationRailExtended,
    );
  }
}

@freezed
sealed class Settings with _$Settings {
  const Settings._();
  factory Settings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool isNavigationRailExtended,
  }) = _Settings;
}
