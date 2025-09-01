import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
class SharedPreferences extends _$SharedPreferences {
  @override
  Future<SharedPreferencesWithCache> build() async {
    return await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{
          'themeMode',
          'isNavigationRailExtended',
        },
      ),
    );
  }

  Future<void> saveData(String key, dynamic value) async {
    final prefsWithCache = state.requireValue;
    switch (value) {
      case int():
        await prefsWithCache.setInt(key, value);
        break;
      case String():
        await prefsWithCache.setString(key, value);
        break;
      case bool():
        await prefsWithCache.setBool(key, value);
        break;
      case double():
        await prefsWithCache.setDouble(key, value);
        break;
      case List<String>():
        await prefsWithCache.setStringList(key, value);
        break;
      default:
        throw ArgumentError('SharedPreferencesManager: Invalid Type');
    }
  }

  Future<dynamic> get(String key) async {
    final prefsWithCache = state.requireValue;
    await prefsWithCache.reloadCache();
    return prefsWithCache.get(key);
  }

  Future<String?> getString(String key) async {
    return (await get(key)) as String?;
  }

  Future<bool?> getBool(String key) async {
    return (await get(key)) as bool?;
  }

  Future<int?> getInt(String key) async {
    return (await get(key)) as int?;
  }

  Future<double?> getDouble(String key) async {
    return (await get(key)) as double?;
  }

  Future<List<String>?> getStringList(String key) async {
    return (await get(key)) as List<String>?;
  }

  Future<void> remove(String key) async {
    final prefsWithCache = state.requireValue;
    await prefsWithCache.remove(key);
  }
}
