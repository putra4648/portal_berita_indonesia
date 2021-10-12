import 'package:flutter_test/flutter_test.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/app/app.dart';

void main() {
  group('App', () {
    late NewsRepository newsRepository;
    setUp(() {
      newsRepository = NewsRepository();
    });
    testWidgets('find title name "Portal Berita Indonesia" ', (tester) async {
      await tester.pumpWidget(App(newsRepository: newsRepository));
      final findBodyText = find.text('Portal Berita Indonesia');

      expect(findBodyText, findsOneWidget);
    });
  });
}
