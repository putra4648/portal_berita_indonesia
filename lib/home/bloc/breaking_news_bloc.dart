import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_repository/news_repository.dart';

part 'breaking_news_event.dart';
part 'breaking_news_state.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  BreakingNewsBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(BreakingNewsInitial()) {
    on<BreakingNewsEvent>((event, emit) async {
      if (event is BreakingNewsFetched) {
        emit(BreakingNewsLoading());
        try {
          final _breakingNewsResult =
              await _newsRepository.getTopHeadlineNews(CountryCode.id);
          if (_breakingNewsResult != null) {
            emit(BreakingNewsLoadedSuccess(
                breakingNewsArticles: List<Article>.from(_breakingNewsResult)));
          } else {
            emit(const BreakingNewsLoadedSuccess(
                breakingNewsArticles: <Article>[]));
          }
        } catch (e) {
          emit(BreakingNewsFailed(error: e.toString()));
        }
      }
    });
  }

  final NewsRepository _newsRepository;
}
