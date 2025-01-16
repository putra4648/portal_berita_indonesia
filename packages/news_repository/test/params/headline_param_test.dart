import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:news_repository/src/enums/date_field.dart';
import 'package:news_repository/src/params/params.dart';
import 'package:test/test.dart';

import '../json_reader.dart';

void main() {
  late String jsonString;
  late Uri url;

  setUp(() async {
    jsonString = JsonReader.read('headline');
    url = Uri.parse(
        'http://example.org?include_similar=true&published_after=2025-01-01');
    await initializeDateFormatting('en_US');
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
