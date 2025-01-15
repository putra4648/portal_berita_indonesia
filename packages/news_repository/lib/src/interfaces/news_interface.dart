import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_repository/src/enums/enums.dart';
import 'package:news_repository/src/helpers/helpers.dart';
import 'package:news_repository/src/interfaces/interfaces.dart';
import 'package:news_repository/src/models/models.dart';

/// A class to make request TopHeadlines
abstract class NewsTopHeadlines<T extends Article> {
  /// Return topHeadlines from [Future<List<Article>>]
  Future<List<T>?> getTopHeadlineNews({
    CountryCode? countryCode,
    CategoryType? category,
    String keyword = '',
    int pageSize = 20,
    int page = 1,
  });
}

/// An interface to make request about News with
/// search function
abstract class NewsSearchHeadlines<T extends Article> {
  /// Return searchNews from Future with [args]
  Future<List<T>?> getSearchNews(String args);
}

/// An interface to make request News by Source
abstract class NewsSearchHeadlinesBySource<T extends Article> {
  /// Return searchNewsBySource from Future with [sourceName]
  Future<List<T>?> getSearchNewsBySource(String sourceName);
}

/// Base class to implement News intefaces
class NewsInterface extends HttpClientInterface
    implements NewsTopHeadlines<Article>, NewsSearchHeadlines<Article> {
  /// {@macro news_interface}
  NewsInterface({required this.apiKey})
      : super(
          dio: Dio(
            BaseOptions(
              contentType: 'application/json',
              baseUrl: 'https://newsapi.org/v2',
              headers: <String, String>{'authorization': apiKey},
            ),
          ),
          cookieJar: CookieJar(),
        );

  /// Provide APIKEY
  final String apiKey;

  @override
  Future<List<Article>?> getSearchNews(String args) async {
    final _argsEncoded = Uri.encodeQueryComponent(args);
    try {
      final _response = await super.dio.get<Map>('/everything?q=$_argsEncoded');

      final _result = List<Article>.from((_response.data!['articles'] as List)
          .cast<Map<String, dynamic>>()
          .map<Article>(Article.fromMap));
      return _result;
    } on DioException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  @override
  Future<List<Article>?> getTopHeadlineNews({
    CountryCode? countryCode,
    CategoryType? category,
    String keyword = '',
    int pageSize = 20,
    int page = 1,
  }) async {
    var _countryCode = '';
    var _category = '';

    if (countryCode != null) {
      _countryCode = mappingCountryToString(countryCode);
    }
    if (category != null) {
      _category = mappingCategoryToString(category);
    }

    try {
      final _response = await super.dio.get<Map>(
          '/top-headlines?q=$keyword&category=$_category&country=$_countryCode&pageSize=$pageSize&page=$page');
      final _result = List<Article>.from((_response.data!['articles'] as List)
          .cast<Map<String, dynamic>>()
          .map<Article>(Article.fromMap));
      return _result;
    } on DioException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }
}
