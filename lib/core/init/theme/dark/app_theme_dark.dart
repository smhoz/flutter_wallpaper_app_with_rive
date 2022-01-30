import 'package:flutter/material.dart';

import '../../../constants/app/app_constant.dart';
import '../colors/gradient_colors.dart';
import '../text/text_theme.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  AppThemeDark._();
  static AppThemeDark get instance => _instance ??= AppThemeDark._();

  ThemeData get theme => ThemeData(
      fontFamily: ApplicationConstants.FONT_FAMILY,
      colorScheme: ColorScheme.dark(primary: GradientColors.sunset.last),
      cardColor: const Color(0xFF1A1A1A),
      scaffoldBackgroundColor: const Color(0xFF121212),
      textTheme: TextTheme(
        headline1: CustomTextTheme.instance?.headline1,
        headline2: CustomTextTheme.instance?.headline2,
        headline3: CustomTextTheme.instance?.headline3,
        bodyText1: CustomTextTheme.instance?.bodyText1,
        bodyText2: CustomTextTheme.instance?.bodyText2,
        overline: CustomTextTheme.instance?.overline,
      ),
      brightness: Brightness.dark,
      toggleableActiveColor: Colors.grey.shade800,
      shadowColor: GradientColors.sunset.last);
}
