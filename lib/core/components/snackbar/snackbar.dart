import 'package:flutter/material.dart';

import '../../constants/app/widgets_constant.dart';
import '../../extension/context_extension.dart';
import '../border/custom_border.dart';

class CustomSnackBar {
  static CustomSnackBar? _instance;
  CustomSnackBar._();
  static CustomSnackBar get instance => _instance ??= CustomSnackBar._();

  void showSnackbar(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(_snackbar(context, label));
  }

  SnackBar _snackbar(BuildContext context, String label) {
    return SnackBar(
      content: Text(
        label,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyText1,
      ),
      elevation: 8,
      duration: WidgetsConstant.instance.snackBarDuration,
      backgroundColor: context.theme.canvasColor,
      shape: RoundedRectangleBorder(
          borderRadius: CustomBorderRadius.onlyTopLeftAndTopRightCircular()),
    );
  }
}
