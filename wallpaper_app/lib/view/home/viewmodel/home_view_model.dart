import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../core/init/mixin/message.mixin.dart';
import '../model/photo_model.dart';
import '../service/home_network_service.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/init/notifier/theme_notifier.dart';

class HomeViewModel extends ChangeNotifier
    with MessageNotifierMixin, BaseViewModel {
  late BuildContext context;

  bool _isScroll = false;
  bool get isScroll => _isScroll;

  bool _isFetchingImage = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<Photo> _photos = [];
  List<Photo> get getPhoto => _photos;

  void changeIsScroll(bool scroll) {
    _isScroll = scroll;
    notifyListeners();
  }

  changeIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void fetchNextImage() async {
    if (_isFetchingImage) return;
    _isFetchingImage = true;

    dynamic photos = await HomeNetworkService.instance.fetchNextImage();
    if (photos is List) {
      _photos.addAll(photos as List<Photo>);
    } else {
      notifyError(photos);
    }

    _isFetchingImage = false;

    notifyListeners();
  }

  Future<dynamic> searchPhoto(String value) async {
    changeIsLoading();
    dynamic photos = await HomeNetworkService.instance.searchPhoto(value);
    if (photos is List) {
      return photos;
    } else {
      notifyError(photos);
    }
    changeIsLoading();

    notifyListeners();

    return photos;
  }

  @override
  void errorClear() {
    clearError();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void changeTheme(AppThemes appThemes) {
    Provider.of<ThemeNotifier>(context, listen: false).setTheme(appThemes);
  }
}
