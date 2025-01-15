import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

/// An interface for making Http request
/// with logging information
class HttpClientInterface {
  /// {@macro HttpClientInterface}
  HttpClientInterface({required CookieJar cookieJar, required Dio dio})
      : _cookieJar = cookieJar,
        _dio = dio {
    _dio.interceptors.addAll([LogInterceptor(), CookieManager(_cookieJar)]);
  }

  final Dio _dio;
  final CookieJar _cookieJar;

  /// Getter
  Dio get dio => _dio;
}
