import 'package:cryptocurrency_application/models/theme_key.dart';
import 'package:cryptocurrency_application/themes/themes.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData getThemeFromKey(ThemeKey themeKey) {
    switch (themeKey) {
      case ThemeKey.LIGHT:
        return lightTheme;
        break;
      case ThemeKey.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
