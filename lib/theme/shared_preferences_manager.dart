import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  // Helper function to initialize SharedPreferencesWithCache
  static Future<SharedPreferencesWithCache> _initPrefs() async {
    return await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'themeMode'},
      ),
    );
  }

  static Future<void> saveData(String key, dynamic value) async {
    final prefsWithCache = await _initPrefs();
    if (value is int) {
      await prefsWithCache.setInt(key, value);
    } else if (value is String) {
      await prefsWithCache.setString(key, value);
    } else if (value is bool) {
      await prefsWithCache.setBool(key, value);
    } else {
      throw ArgumentError('SharedPreferencesManager: Invalid Type');
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefsWithCache = await _initPrefs();
    await prefsWithCache.reloadCache();
    return prefsWithCache.get(key);
  }

  static Future<void> deleteData(String key) async {
    final prefsWithCache = await _initPrefs();
    await prefsWithCache.remove(key);
  }
}
