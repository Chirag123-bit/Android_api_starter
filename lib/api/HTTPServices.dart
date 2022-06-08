import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';

class HTTPServices {
  static final HTTPServices _instance = HTTPServices.internal();
  factory HTTPServices() => _instance;
  HTTPServices.internal();

  Dio? _dio;
  Dio getDioInstance() {
    if (_dio == null) {
      return Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
      ));
    } else {
      return _dio!;
    }
  }
}
