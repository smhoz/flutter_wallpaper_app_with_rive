import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientContainer extends StatelessWidget {
  final List<Color> gradientColors;
  final Widget child;
  const GradientContainer(
      {Key? key, required this.gradientColors, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
            const Offset(4.0, 24.0), const Offset(24.0, 4.0), gradientColors);
      },
      child: child,
    );
  }
}
