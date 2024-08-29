import 'package:adsats_amplify_gen_2/theme/shared_preferences_manager.dart';
import 'package:adsats_amplify_gen_2/theme/theme_data.dart';
import 'package:flutter/material.dart';

// can be customise for more fine-tuned feel
final lightMode = GlobalThemeData.lightThemeData;
final darkMode = GlobalThemeData.darkThemeData;

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  late bool _themeBool;

  ThemeMode get themeMode => _themeMode;

  bool get themeBool => _themeBool;

  ThemeData get lightTheme => ThemeData();

  ThemeNotifier() {
    SharedPreferencesManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeMode = ThemeMode.light;
        _themeBool = false;
      } else {
        _themeMode = ThemeMode.dark;
        _themeBool = true;
      }
      notifyListeners();
    });
  }

  void switchThemeMode() async {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      SharedPreferencesManager.saveData('themeMode', 'dark');
    } else {
      _themeMode = ThemeMode.light;
      SharedPreferencesManager.saveData('themeMode', 'light');
    }
    _themeBool != _themeBool;
    notifyListeners();
  }
}
