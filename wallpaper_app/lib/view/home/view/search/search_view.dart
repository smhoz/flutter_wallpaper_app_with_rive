import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/image/image.dart';
import '../../../../core/components/list/staggered_grid_view.dart';
import '../../../../core/components/search/search_field.dart';
import '../../../../core/constants/app/widgets_constant.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../viewmodel/home_view_model.dart';
import '../../model/photo_model.dart';
import '../photo_view.dart';

class SearchView extends StatelessWidget {
  final String searchValue;
  final List<Photo> photos;

  const SearchView({Key? key, required this.searchValue, required this.photos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: searchValue);
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? WidgetsConstant.instance.loadingWidget()
                : ListView(
                    shrinkWrap: true,
                    physics: WidgetsConstant.instance.scrollPhysics,
                    children: [
                      _searchField(controller, model),
                      photos.isEmpty
                          ? WidgetsConstant.instance.notFound(controller.text)
                          : _gridView(context, photos)
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget _searchField(TextEditingController controller, HomeViewModel model) {
    return SearchField(
      editingController: controller,
      iconOnTap: () async {
        final _photos = await model.searchPhoto(controller.text);
        photos.clear();
        photos.addAll(_photos);
      },
    );
  }

  Widget _gridView(BuildContext context, List<Photo> photos) {
    return CustomStaggeredGridView(
      itemCount: photos.length,
      itemBuilder: (context, index) => _image(context, photos[index]),
    );
  }

  Widget _image(BuildContext context, Photo photo) {
    String tag = photo.id.toString();
    return CustomNetworkImage(
      imageURL: photo.src!.portrait!,
      heroTag: tag,
      onTap: () => NavigationService.instance.navigateToPage(
        path: NavigationConstants.PHOTO_VIEW,
        data: PhotoView(heroTag: tag, photo: photo),
      ),
    );
  }
}
