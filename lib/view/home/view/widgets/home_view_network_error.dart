import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app_with_rive/core/components/error/network_error.dart';
import 'package:flutter_wallpaper_app_with_rive/core/constants/app/assets_constant.dart';
import 'package:flutter_wallpaper_app_with_rive/core/extension/extensions.dart';

class HomeViewNetworkError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onTap;
  const HomeViewNetworkError(
      {Key? key, required this.errorMessage, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkError(
      errorMessage: errorMessage + " Error\n" + "pleaseTryAgainLater".locale,
      buttonText: "goback".locale,
      assetPath: AssetsConstant.errorPng,
    );
  }
}
