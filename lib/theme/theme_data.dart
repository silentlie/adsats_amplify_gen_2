import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/ColorScheme-class.html
// try using ColorScheme.dark()/light()/fromseed()/... because everything is refrence from scoloScheme
class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            return colorScheme.onSecondary; // colour
          }),
          foregroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            return colorScheme.secondary; // colour
          }),
        ),
      ),
    );
  }
  // https://coolors.co/visualizer/05abc4-89c2af-047889-0490ae-f5eae0-01579b

  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF01579B),
    primary: const Color(0xFF01579B),
    onPrimary: const Color(0xFFF5EAE0),
    primaryContainer: const Color(0xFF05ABC4),
    secondary: const Color(0xff0490AE),
    onSecondary: const Color(0xFFF5EAE0),
    tertiary: const Color(0xFF047889),
    onTertiary: const Color(0xFFF5EAE0),
    tertiaryContainer: const Color(0xFF89C2AF),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: const Color(0xFFE1F5FE),
    onSurface: const Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF01579B),
    // primary: const Color(0xFFF5EAE0),
    // onPrimary: const Color(0xFF01579B),
    // secondary: const Color(0xFF0288D1),
    // onSecondary: Colors.white,
    // surface: const Color(0xFF121212),
    // error: Colors.redAccent,
    // onError: Colors.white,
    // onSurface: Colors.white,
    brightness: Brightness.dark,
  );

  // Button Theme

  // Font theme
}
