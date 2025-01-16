import 'package:news_repository/src/params/params.dart';
import 'package:test/test.dart';

import '../json_reader.dart';

void main() {
  late String jsonString;
  late Uri url;

  setUp(() {
    jsonString = JsonReader.read('headline');
    url = Uri.parse('http://example.org?include_similar=true');
  });

  test('JSON string is not null', () {
    expect(jsonString, isNotNull);
  });

  test('When parse URL parameter should return valid Object class', () {
    const param = HeadlineParam(includeSimilar: true);
    final headlineJson = param.toJson();

    expect(url.queryParameters['include_similar'] == 'true',
        headlineJson['include_similar']);
  });

  test('When parse from Object class should return valid URL parameter', () {
    const param = HeadlineParam(includeSimilar: true);
    final headlineToJson = param.toJson();

    expect(url.queryParameters.containsKey('include_similar'), isTrue);
    expect(headlineToJson.containsKey('include_similar'), isTrue);
    expect(headlineToJson['include_similar'], isTrue);
  });
}
