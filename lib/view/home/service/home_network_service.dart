import '../../../core/init/network/network_manager.dart';

class HomeNetworkService {
  static HomeNetworkService? _instance;
  HomeNetworkService._();
  static HomeNetworkService get instance =>
      _instance ??= HomeNetworkService._();

  int page = 3;
  int perPage = 5;
  Future<dynamic> fetchNextImage() async {
    final getValue = await NetworkManager.instance?.dioGet(
      page,
      perPage,
    );
    if (perPage == 80) {
      // can return a maximum of 80 requests at one page
      page += 1;
    }
    perPage += perPage;

    return getValue;
  }

  Future<dynamic> searchPhoto(String value) async {
    final photos =
        (await NetworkManager.instance?.dioSearchGet(value, 8))!;
    return photos;
  }
}
