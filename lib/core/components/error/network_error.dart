import 'package:flutter/material.dart';

import '../../constants/app/assets_constant.dart';
import '../../extension/context_extension.dart';
import '../../extension/extensions.dart';

class NetworkError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onTap;
  const NetworkError(
      {Key? key, required this.errorMessage, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(AssetsConstant.errorPng),
              Text(
                errorMessage + " Error\n" + "pleaseTryAgainLater".locale,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText2,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: onTap,
              child: Text(
                "goback".locale,
                style: context.textTheme.bodyText1,
              ))
        ],
      ),
    );
  }
}
