import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_repository/news_repository.dart';

part 'breaking_news_event.dart';
part 'breaking_news_state.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  BreakingNewsBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(const BreakingNewsState()) {
    on<BreakingNewsEvent>((event, emit) async {
      if (event is BreakingNewsFetched) {
        try {
          final _breakingNewsResult = await _newsRepository.getTopHeadlineNews(
              countryCode: CountryCode.id);
          if (_breakingNewsResult != null) {
            emit(state.copyWith(
                isLoading: !state.isLoading,
                breakingNewsArticles: List<Article>.from(_breakingNewsResult)));
          } else {
            return;
          }
        } catch (e) {
          emit(
              state.copyWith(isLoading: !state.isLoading, error: e.toString()));
        }
      }
    });
  }

  final NewsRepository _newsRepository;
}
