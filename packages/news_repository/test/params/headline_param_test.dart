import 'package:test/test.dart';

import '../json_reader.dart';

void main() {
  test('JSON string is not null', () {
    final reader = JsonReader.read();

    expect(reader, isNotNull);
  });
}
