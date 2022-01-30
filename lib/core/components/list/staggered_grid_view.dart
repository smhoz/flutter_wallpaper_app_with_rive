import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constants/app/widgets_constant.dart';

class CustomStaggeredGridView extends StatelessWidget {
  final ScrollController? scrollController;
  final int itemCount;
  final Function(BuildContext context, int index) itemBuilder;
  const CustomStaggeredGridView(
      {Key? key,
      this.scrollController,
      required this.itemCount,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: WidgetsConstant.instance.scrollPhysics,
      controller: scrollController ?? ScrollController(),
      staggeredTileBuilder: WidgetsConstant.instance.staggeredTileCount,
      itemCount: itemCount,
      crossAxisCount: WidgetsConstant.instance.crossAxisCount,
      crossAxisSpacing: WidgetsConstant.instance.crossAxisSpacing,
      mainAxisSpacing: WidgetsConstant.instance.mainAxisSpacing,
      itemBuilder: (context, index) => itemBuilder(context, index),
    );
  }
}
