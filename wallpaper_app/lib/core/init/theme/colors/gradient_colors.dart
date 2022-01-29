import 'package:flutter/material.dart';

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [const Color(0xFF6448FE),const  Color(0xFF5FC6FF)];
  static List<Color> sunset = [const  Color(0xFFFE6197),const  Color(0xFFFFB463)];
  static List<Color> sea = [const  Color(0xFF61A3FE),const  Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738),const  Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD),const  Color(0xFFFF8484)];

  static LinearGradient linearGradient = LinearGradient(
      colors: GradientColors.sunset,
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.5, 0.0),
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp);

  static LinearGradient linearLightGradient = LinearGradient(
      colors: lightGradientColors,
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.5, 0.0),
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp);

  static List<Color> lightGradientColors = [
   const  Color(0xFF5FC6FF),
   const  Color(0xFFdce7f0),
  ];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}
