import 'package:intl/intl.dart';
import 'package:news_repository/src/enums/date_field.dart';
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

  group('DateFormat testing', () {
    test('When parse YYYY-MM-DD param should return valid date', () {
      final url = Uri.parse(
          'http://example.org?include_similar=true&published_after=2025-01-01');
      final dateStringValue = url.queryParameters['published_after'];
      final date = DateFormat(DateField.fullDate.value).parse(dateStringValue!);

      expect(date, isNotNull);
      expect(date.year, 2025);
    });

    test('When parse invalid YYYY-MM-DD param should throw Error', () {
      final url = Uri.parse(
          'http://example.org?include_similar=true&published_after=2025');
      final dateStringValue = url.queryParameters['published_after'];

      expect(() => DateFormat(DateField.fullDate.value).parse(dateStringValue!),
          throwsFormatException);
    });
  });
}
