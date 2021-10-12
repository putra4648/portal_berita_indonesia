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
  Future<List<T>?> getTopHeadlineNews(
      [CountryCode? countryCode, CategoryType? category, String keyword = '']);
}

/// An interface to make request about News with
/// search function
abstract class NewsSearchHealines<T extends Article> {
  /// Return searchNews from Future with [args]
  Future<List<T>?> getSearchNews(String args);
}

/// Base class to implement News intefaces
class NewsInterface extends HttpClientInterface
    implements NewsTopHeadlines<Article>, NewsSearchHealines<Article> {
  /// {@macro} news_interface
  NewsInterface()
      : super(
          dio: Dio(
            BaseOptions(
              contentType: 'application/json',
              baseUrl: 'https://newsapi.org/v2',
              headers: <String, String>{
                'authorization': '5ac515632a9c44629f5309f361c5aeaf'
              },
            ),
          ),
          cookieJar: CookieJar(),
        );

  @override
  Future<List<Article>?> getSearchNews(String args) async {
    final _argsEncoded = Uri.encodeQueryComponent(args);
    try {
      final _response = await super.dio.get<Map>('/everything?q=$_argsEncoded');

      final _result = List<Article>.from((_response.data!['articles'] as List)
          .cast<Map<String, dynamic>>()
          .map<Article>((map) => Article.fromMap(map)));
      return _result;
    } on DioError catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  @override
  Future<List<Article>?> getTopHeadlineNews(
      [CountryCode? countryCode,
      CategoryType? category,
      String keyword = '']) async {
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
          '/top-headlines?q=$keyword&category=$_category&country=$_countryCode');
      final _result = List<Article>.from((_response.data!['articles'] as List)
          .cast<Map<String, dynamic>>()
          .map<Article>((map) => Article.fromMap(map)));
      return _result;
    } on DioError catch (e) {
      debugPrint(e.message);
      return null;
    }
  }
}
