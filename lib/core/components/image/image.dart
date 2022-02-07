import 'package:flutter/material.dart';

import '../../constants/app/widgets_constant.dart';
import '../../extension/context_extension.dart';
import '../border/custom_border.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? heroTag;
  final VoidCallback? onTap;
  final String imageURL;
  const CustomNetworkImage(
      {Key? key, this.heroTag, this.onTap, required this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? UniqueKey().toString(),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: context.paddingLow,
          child: ClipRRect(
              borderRadius: CustomBorderRadius.allCircular(),
              child: Image.network(
                imageURL,
                loadingBuilder: loadingBuilder,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }

  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}
