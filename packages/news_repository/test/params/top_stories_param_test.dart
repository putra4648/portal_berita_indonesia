import 'dart:convert';

import 'package:news_repository/src/params/params.dart';
import 'package:news_repository/src/params/stories_param.dart';
import 'package:test/test.dart';

import '../json_reader.dart';

void main() {
  late String jsonString;
  late Uri url;

  setUp(() {
    jsonString = JsonReader.read('top-stories');
    url = Uri.parse('http://example.org?search=biden');
  });

  test('JSON string is not null', () {
    expect(jsonString, isNotNull);
  });

  test('When parse URL parameter should return valid Object class', () {
    const param = StoriesParam(search: 'biden');
    final storiesJson = param.toJson();

    expect(url.queryParameters['search'], storiesJson['search']);
  });

  test('When parse from Object class should return valid URL parameter', () {
    const param = StoriesParam(search: 'biden');
    final storiesJson = param.toJson();

    expect(url.queryParameters.containsKey('search'), isTrue);
    expect(storiesJson.containsKey('search'), isTrue);
    expect(storiesJson['search'], 'biden');
  });
}
