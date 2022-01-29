import 'package:flutter/material.dart';

import '../../constants/app/widgets_constant.dart';

class CustomBorderRadius extends BorderRadius {
  CustomBorderRadius.allCircular()
      : super.circular(WidgetsConstant.instance.borderRadius);

  CustomBorderRadius.onlyTopLeftAndTopRightCircular()
      : super.only(
            topLeft: Radius.circular(WidgetsConstant.instance.borderRadius),
            topRight: Radius.circular(WidgetsConstant.instance.borderRadius));

  CustomBorderRadius.onlyBottomLeftAndBottomRightCircular()
      : super.only(
            bottomLeft: Radius.circular(WidgetsConstant.instance.borderRadius),
            bottomRight:
                Radius.circular(WidgetsConstant.instance.borderRadius));
}
