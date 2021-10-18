import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_repository/news_repository.dart';

part 'recommendation_news_event.dart';
part 'recommendation_news_state.dart';

class RecommendationNewsBloc
    extends Bloc<RecommendationNewsEvent, RecommendationNewsState> {
  RecommendationNewsBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const RecommendationNewsState()) {
    on<RecommendationNewsEvent>((event, emit) async {
      if (event is RecommendedNewsGenerated) {
        final recommendedArticles = await _newsRepository.getTopHeadlineNews(
            page: event.page, pageSize: 5, countryCode: CountryCode.id);

        if (recommendedArticles != null) {
          emit(RecommendationNewsState(
              recommendedArticles: List<Article>.from(recommendedArticles)));
        } else {
          return;
        }
      }
    });
  }

  final NewsRepository _newsRepository;
}
