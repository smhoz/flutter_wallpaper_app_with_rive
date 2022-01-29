import 'package:dio/dio.dart';

import '../../../view/home/model/core_model.dart';
import '../../../view/home/model/photo_model.dart';
import '../../constants/network/network_constant.dart';
import 'exception/network_exceptions.dart';

class NetworkManager {
  static NetworkManager? _instance;
  NetworkManager._() {
    _dio = Dio(BaseOptions(
        baseUrl: NetworkConstant.BASE_URL, headers: NetworkConstant.HEADERS));
  }
  static NetworkManager? get instance {
    _instance ??= NetworkManager._();
    return _instance;
  }

  late Dio _dio;

  Future<dynamic> dioGet(int page, int perpage) async {
    try {
      final response = await _dio.get("curated?page=$page&per_page=$perpage");
      return photosFromAPI(response.data);
    } on DioError catch (e) {
      return errorMessage(e);
    }
  }

  Future<dynamic> dioSearchGet(String search, int perPage) async {
    try {
      final response = await _dio.get("search?query=$search&per_page=$perPage");
      return photosFromAPI(response.data);
    } on DioError catch (e) {
      return errorMessage(e);
    }
  }

  List<Photo> photosFromAPI(dynamic data) {
    Map<String, dynamic> responseBody = data;
    Core core = Core.fromJson(responseBody);
    return core.photos ?? [];
  }

  String errorMessage(dynamic error) {
    NetworkExceptions networkExceptions =
        NetworkExceptions.getDioException(error);
    return NetworkExceptions.getErrorMessage(networkExceptions);
  }
}
