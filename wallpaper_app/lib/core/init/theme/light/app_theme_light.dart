import 'package:flutter/material.dart';

import '../../../constants/app/app_constant.dart';
import '../text/text_theme.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  AppThemeLight._();
  static AppThemeLight get instance => _instance ??= AppThemeLight._();

  ThemeData get theme => ThemeData(
      fontFamily: ApplicationConstants.FONT_FAMILY,
      cardColor: Colors.white,
      primaryIconTheme: const IconThemeData(color: Color(0xFFBAE0E0)),
      scaffoldBackgroundColor: const Color(0xFFF1FEFF),
      textTheme: TextTheme(
        headline1: CustomTextTheme.instance?.headline1,
        headline2: CustomTextTheme.instance?.headline2,
        headline3: CustomTextTheme.instance?.headline3,
        bodyText1: CustomTextTheme.instance?.bodyText1,
        bodyText2: CustomTextTheme.instance?.bodyText2,
        overline: CustomTextTheme.instance?.overline,
      ));
}
