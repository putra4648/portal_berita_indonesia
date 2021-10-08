import 'package:flutter_test/flutter_test.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/app/app.dart';
import 'package:portal_berita_indonesia/home/home.dart';

void main() {
  group('App', () {
    testWidgets('renders main App', (tester) async {
      await tester.pumpWidget(App(newsRepository: NewsRepository()));
      expect(find.byWidget(const Home()), findsOneWidget);
    });
  });
}
