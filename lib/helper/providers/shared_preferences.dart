import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@Riverpod(keepAlive: true)
class SharedPreferences extends _$SharedPreferences {
  @override
  Future<SharedPreferencesWithCache> build() async {
    return await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{
          'themeMode',
          'isNavigationRailExtended',
          'flightCrewRecordFavourites'
        },
      ),
    );
  }

  Future<void> saveData(String key, Object value) async {
    final prefsWithCache = state.requireValue;
    switch (value) {
      case int value:
        await prefsWithCache.setInt(key, value);
        break;
      case String value:
        await prefsWithCache.setString(key, value);
        break;
      case bool value:
        await prefsWithCache.setBool(key, value);
        break;
      case double value:
        await prefsWithCache.setDouble(key, value);
        break;
      case List<String> value:
        await prefsWithCache.setStringList(key, value);
        break;
      case Map<String, dynamic> value:
        await prefsWithCache.setString(key, jsonEncode(value));
        break;
      default:
        throw ArgumentError('SharedPreferencesManager: Invalid Type');
    }
  }

  Future<T> get<T>(String key) async {
    final prefsWithCache = state.requireValue;
    await prefsWithCache.reloadCache();
    return prefsWithCache.get(key) as T;
  }

  Future<String?> getString(String key) async {
    return await get<String?>(key);
  }

  Future<bool?> getBool(String key) async {
    return await get<bool?>(key);
  }

  Future<int?> getInt(String key) async {
    return await get<int?>(key);
  }

  Future<double?> getDouble(String key) async {
    return await get<double?>(key);
  }

  Future<List<String>?> getStringList(String key) async {
    return await get<List<String>?>(key);
  }

  Future<Map<String, dynamic>> getMap(String key) async {
    final s = await getString(key);
    if (s == null || s.isEmpty) return {};
    return jsonDecode(s) as Map<String, dynamic>;
  }

  Future<Map<String, List<String>>> getStringListMap(String key) async {
    final raw = await getMap(key);
    return raw.map((k, v) => MapEntry(k, List<String>.from(v as List)));
  }

  Future<void> remove(String key) async {
    final prefsWithCache = state.requireValue;
    await prefsWithCache.remove(key);
  }
}
