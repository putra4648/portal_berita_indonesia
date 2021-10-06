import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

/// An interface for making Http request
/// with logging information
class HttpClientInterface {
  /// {@macro} HttpClientInterface
  HttpClientInterface()
      : _cookieJar = CookieJar(),
        _dio = Dio(BaseOptions(
          contentType: 'application/json',
          baseUrl: 'https://newsapi.org/v2',
          headers: <String, String>{
            'authorization': '5ac515632a9c44629f5309f361c5aeaf'
          },
        )) {
    _dio.interceptors.addAll([LogInterceptor(), CookieManager(_cookieJar)]);
  }

  final Dio _dio;
  final CookieJar _cookieJar;

  /// Getter
  Dio get dio => _dio;
}
