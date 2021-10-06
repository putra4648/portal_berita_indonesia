import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_repository/src/http_client_interface.dart';
import 'package:news_repository/src/models/article.dart';

void main() {
  late HttpClientInterface httpClientInterface;

  setUp(() {
    httpClientInterface = HttpClientInterface();
  });
  test('Should return List<Article> from top headlines', () async {
    final response =
        await httpClientInterface.dio.get<Map>('/top-headlines?country=id');
    if (response.data != null) {
      final result = List<Article>.from((response.data!['articles'] as List)
          .cast<Map<String, dynamic>>()
          .map<Article>((e) => Article.fromMap(e)));
      expect(result, equals(isA<List<Article>>()));
    }
  });
}
