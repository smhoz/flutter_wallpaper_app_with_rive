import 'package:flutter/material.dart';

import '../constants/enums/local_keys_enum.dart';
import '../init/cache/local_manager.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get statusbarHeight => MediaQuery.of(this).padding.top;

  double get lowHeight => height * 0.005;
  double get mediumHeight => height * 0.02;
  double get highHeight => height * 0.04;
  double get cardHeight => height * 0.17;
  double get iconHeight => height * 0.0075;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark =>
      LocalManager.instance.getBoolValue(StorageKeys.theme) == true;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeight);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeight);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeight);
  EdgeInsets get iconPadding => EdgeInsets.symmetric(vertical: iconHeight);
  EdgeInsets get statusbarHeightPadding =>
      EdgeInsets.only(top: statusbarHeight);

  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowHeight);
  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumHeight);
}
