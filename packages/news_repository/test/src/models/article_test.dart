import 'package:flutter_test/flutter_test.dart';
import 'package:news_repository/src/models/models.dart';

void main() {
  test('Should return true if List<Article> contain single Article', () {
    const article = Article(author: 'Author');
    final articles = <Article>[article];

    expect(articles.contains(article), equals(isTrue));
  });
}
