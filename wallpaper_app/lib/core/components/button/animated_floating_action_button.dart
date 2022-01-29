import 'package:flutter/material.dart';
import '../../constants/app/widgets_constant.dart';
import '../../extension/context_extension.dart';
import '../../init/theme/colors/gradient_colors.dart';

class GradientFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Widget child;
  final Gradient gradient;
  const GradientFloatingActionButton(
      {Key? key,
      required this.onTap,
      this.height,
      this.width,
      required this.gradient,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: WidgetsConstant.instance.normalDuration,
        height: height ?? context.height * 0.1,
        width: width ?? context.height * 0.1,
        decoration: BoxDecoration(
            gradient: gradient, shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}
