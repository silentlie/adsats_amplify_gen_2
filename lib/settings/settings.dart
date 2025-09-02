import 'package:adsats_amplify_gen_2/helper/providers/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings.g.dart';
part 'settings.freezed.dart';

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<Settings> build() async {
    await ref.watch(sharedPreferencesProvider.future);
    final prefs = ref.read(sharedPreferencesProvider.notifier);

    final themeModeStr = await prefs.getString('themeMode');
    final themeMode = switch (themeModeStr) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => ThemeMode.system,
    };

    final isExtended = await prefs.getBool('isNavigationRailExtended') ?? false;

    final flightCrewRecordFavourites =
        await prefs.getStringListMap('flightCrewRecordFavourites');

    return Settings(
      themeMode: themeMode,
      isNavigationRailExtended: isExtended,
      flightCrewRecordFavourites: flightCrewRecordFavourites,
    );
  }

  Future<Settings> _read() async => state.value ?? await future;

  Future<void> updateThemeMode(ThemeMode newMode) async {
    final curr = await _read();
    if (curr.themeMode == newMode) return;
    state = AsyncData(curr.copyWith(themeMode: newMode));
    final prefs = ref.read(sharedPreferencesProvider.notifier);
    await prefs.saveData('themeMode', newMode.name);
  }

  Future<void> toggleNavigationRailExtended() async {
    final curr = await _read();
    state = AsyncData(
      curr.copyWith(isNavigationRailExtended: !curr.isNavigationRailExtended),
    );
    final prefs = ref.read(sharedPreferencesProvider.notifier);
    await prefs.saveData(
      'isNavigationRailExtended',
      !curr.isNavigationRailExtended,
    );
  }

  Future<void> setFlightCrewRecordFavourites(
    Map<String, List<String>> value,
  ) async {
    final curr = await _read();
    state = AsyncData(curr.copyWith(flightCrewRecordFavourites: value));
    final prefs = ref.read(sharedPreferencesProvider.notifier);
    await prefs.saveData('flightCrewRecordFavourites', value);
  }
}

@freezed
sealed class Settings with _$Settings {
  const Settings._();
  factory Settings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool isNavigationRailExtended,
    @Default({}) Map<String, List<String>> flightCrewRecordFavourites,
  }) = _Settings;
}
