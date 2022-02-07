import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';
import '../../extension/extensions.dart';

class NetworkError extends StatelessWidget {
  final String errorMessage;
  final String? assetPath;
  final VoidCallback? onTap;
  final String? buttonText;
  const NetworkError(
      {Key? key,
      required this.errorMessage,
      this.onTap,
      this.assetPath,
      this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              if (assetPath != null) ...[
                Image.asset(assetPath!),
              ],
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText2,
              ),
            ],
          ),
          if (onTap != null) ...[
            ElevatedButton(
                onPressed: onTap,
                child: Text(
                  buttonText ?? "Go Back",
                  style: context.textTheme.bodyText1,
                ))
          ]
        ],
      ),
    );
  }
}
