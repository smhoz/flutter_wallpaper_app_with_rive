import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  ThemeData getTheme() => _themeData;

  setTheme(AppThemes themes) async {
    if (themes == AppThemes.dark) {
      _themeData = AppThemeDark.instance.theme;
    } else {
      _themeData = AppThemeLight.instance.theme;
    }
    notifyListeners();
  }
}
