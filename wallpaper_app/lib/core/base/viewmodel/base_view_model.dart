import 'package:flutter/cupertino.dart';
import '../../constants/enums/app_theme_enum.dart';

abstract class BaseViewModel {
  void setContext(BuildContext context);
  void changeTheme(AppThemes appThemes);
  void errorClear();
}
