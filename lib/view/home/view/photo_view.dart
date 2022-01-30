part of 'home_view.dart';

class PhotoView extends StatelessWidget {
  final Photo photo;
  final String heroTag;

  const PhotoView({Key? key, required this.heroTag, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: heroTag,
        child: GestureDetector(
            onVerticalDragUpdate: (details) =>
                _onVerticalDragUpdate(context, details, photo),
            onTap: () => NavigationService.instance.navigatePop(context),
            child: Stack(
              children: [
                _backgroundImage(context),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    photo.src!.portrait.toString(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: context.cardHeight,
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [_swipeUp(context), _swipeUpText(context)],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  RichText _swipeUpText(BuildContext context) {
    return RichText(
        textScaleFactor: 0.8,
        text: TextSpan(children: [
          TextSpan(
            text: "swipeUP".locale,
            style: context.textTheme.headline1?.copyWith(color: Colors.white),
          ),
        ]));
  }

  SizedBox _swipeUp(BuildContext context) {
    return SizedBox(
      height: context.height * 0.12,
      width: context.height * 0.12,
      child: const RiveAnimation.asset(AssetsConstant.swipeUp),
    );
  }

  Image _backgroundImage(BuildContext context) {
    return Image.network(
      photo.src!.portrait.toString(),
      fit: BoxFit.fill,
      height: context.height,
      width: context.width,
      cacheHeight: 4,
      cacheWidth: 4,
    );
  }

  Future<bool> pushImageURL(Photo photo) async {
    return await launch(photo.url!);
  }

  _onVerticalDragUpdate(
      BuildContext context, DragUpdateDetails details, Photo photo) async {
    if (details.delta.dy < -WidgetsConstant.instance.sensivity) {
      bool isDone = await pushImageURL(photo);
      if (!isDone) {
        CustomSnackBar.instance.showSnackbar(context, "urlNotFound".locale);
      }
    }
  }
}
