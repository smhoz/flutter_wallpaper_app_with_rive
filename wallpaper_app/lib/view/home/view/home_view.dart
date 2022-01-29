import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../core/init/config/provider_config.dart';
import '../../../core/init/theme/colors/gradient_colors.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/button/animated_floating_action_button.dart';
import '../../../core/components/error/network_error.dart';
import '../../../core/components/image/image.dart';
import '../../../core/components/list/staggered_grid_view.dart';
import '../../../core/components/search/search_field.dart';
import '../../../core/constants/app/assets_constant.dart';
import '../../../core/constants/app/widgets_constant.dart';
import '../../../core/constants/navigation/navigation_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../model/photo_model.dart';
import '../viewmodel/home_view_model.dart';
import 'appbar/gradient_appbar.dart';
import 'photo_view.dart';
import 'search/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late HomeViewModel viewModel;
  late final ScrollController scrollController;
  late final ScrollController gridViewScrollController;
  late final TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
    scrollController = ScrollController();
    gridViewScrollController = ScrollController();
    textEditingController = TextEditingController();
    scrollController.addListener(scrollListener);
    viewModel.fetchNextImage();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: viewModel,
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
      },
      onPageBuilder: (context, value) => _scaffold,
    );
  }

  Widget get _scaffold =>
      Consumer<HomeViewModel>(builder: (context, model, child) {
        return Scaffold(
          floatingActionButton: _floatingActionButton(model),
          body: model.error != null
              ? NetworkError(
                  errorMessage: model.error!,
                  onTap: model.errorClear,
                )
              : _scaffoldBody(model, context),
        );
      });

  Widget _floatingActionButton(HomeViewModel model) {
    return GradientFloatingActionButton(
      gradient: context.isDark
          ? GradientColors.linearGradient
          : GradientColors.linearLightGradient,
      onTap: () => scrollController.jumpTo(WidgetsConstant.instance.zero),
      child: const RiveAnimation.asset(
        AssetsConstant.swipeUp,
      ),
      height:
          !model.isScroll ? WidgetsConstant.instance.zero : dynamicHeight(0.1),
    );
  }

  Widget _scaffoldBody(HomeViewModel model, BuildContext context) {
    return SafeArea(
      child: ListView(
        controller: scrollController,
        physics: WidgetsConstant.instance.scrollPhysics,
        shrinkWrap: true,
        children: [
          _animatedAppBar(context, model),
          _imageListView(context, model),
        ],
      ),
    );
  }

  Widget _animatedAppBar(BuildContext context, HomeViewModel model) {
    return AnimatedContainer(
      duration: WidgetsConstant.instance.normalDuration,
      height: dynamicHeight(0.6),
      child: Column(
        children: [
          GradientAppBar(isScroll: model.isScroll),
          SearchField(
            hintText: "findwallpaper".locale,
            editingController: textEditingController,
            iconOnTap: () => _iconOnTap(model),
          ),
          Padding(
            padding: context.paddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "bestofMonths".locale,
                  style: textTheme.bodyText1,
                ),
                _bestOfMonthsListView(model)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageListView(BuildContext context, HomeViewModel model) {
    return ListView(
      shrinkWrap: true,
      physics: WidgetsConstant.instance.scrollPhysics,
      children: [
        _gridView(model),
        Center(
          child: GestureDetector(
            onTap: viewModel.fetchNextImage,
            child: const CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  Widget _gridView(HomeViewModel model) {
    return CustomStaggeredGridView(
      itemCount: model.getPhoto.length,
      itemBuilder: (context, index) => _image(model.getPhoto[index], false),
    );
  }

  Widget _image(Photo photo, bool isBestOfMonths) {
    String tag = isBestOfMonths
        ? photo.id.toString() + photo.hashCode.toString()
        : photo.id.toString();

    return CustomNetworkImage(
      imageURL: photo.src!.portrait!,
      heroTag: tag,
      onTap: () => NavigationService.instance.navigateToPage(
        path: NavigationConstants.PHOTO_VIEW,
        data: PhotoView(heroTag: tag, photo: photo),
      ),
    );
  }

  Widget _bestOfMonthsListView(HomeViewModel model) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: SizedBox(
        height: dynamicHeight(0.25),
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: model.getPhoto.length > 10
              ? 10
              : model.getPhoto.length, // returned max 10 images
          itemBuilder: (context, index) {
            return _image(model.getPhoto[index], true);
          },
        ),
      ),
    );
  }

  void scrollListener() {
    if (scrollController.position.pixels > dynamicHeight(0.2)) {
      viewModel.changeIsScroll(true);
    }
    if (scrollController.position.atEdge) {
      bool isTop = scrollController.position.pixels <= 0;
      if (isTop) {
        if (viewModel.isScroll) {
          viewModel.changeIsScroll(false);
        }
      }
    }
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange) {
      viewModel.fetchNextImage();
    }
  }

  void _iconOnTap(HomeViewModel model) async {
    final photos = await model.searchPhoto(textEditingController.text);

    NavigationService.instance.navigateToPage(
        path: NavigationConstants.SEARCH_VIEW,
        data: SearchView(
          photos: photos,
          searchValue: textEditingController.text,
        ));
  }
}
