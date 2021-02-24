import 'package:cryptocurrency_application/models/theme_key.dart';
import 'package:cryptocurrency_application/themes/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeRepository {
  final Box<ThemeKey> themeBox;
  static const String themeKey = 'themeKey';

  ThemeRepository({@required this.themeBox});

  ThemeData loadTheme() {
    return ThemeUtils.getThemeFromKey(themeBox.get(themeKey));
  }

  Future<void> setTheme(ThemeKey key) async {
    await themeBox.put(themeKey, key);
  }
}
