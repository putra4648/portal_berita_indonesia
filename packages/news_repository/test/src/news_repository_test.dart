// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:news_repository/news_repository.dart';

void main() {
  group('NewsRepository', () {
    test('can be instantiated', () {
      expect(NewsRepository(), isNotNull);
    });
  });
}
