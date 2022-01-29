import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WidgetsConstant {
  static WidgetsConstant? _instance;
  WidgetsConstant._();
  static WidgetsConstant get instance => _instance ??= WidgetsConstant._();

  Duration snackBarDuration = const Duration(seconds: 2);
  Duration normalDuration = const Duration(milliseconds: 800);

  ScrollPhysics scrollPhysics = const BouncingScrollPhysics();

  StaggeredTile staggeredTileCount(int index) =>
      StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);

  int crossAxisCount = 2;
  double crossAxisSpacing = 8;
  double mainAxisSpacing = 10;
  double zero = 0;
  double iconSize = 28;
  double borderRadius = 16;
  double sensivity = 8;

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

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget notFound(String? value) {
    return Center(
      child: Text("$value Not Found"),
    );
  }
}
