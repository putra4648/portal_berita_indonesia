import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_repository/news_repository.dart';

part 'search_news_event.dart';
part 'search_news_state.dart';

class SearchNewsBloc extends Bloc<SearchNewsEvent, SearchNewsState> {
  SearchNewsBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(SearchNewsInitial()) {
    on<SearchNewsEvent>((event, emit) async {
      if (event is SearchNewsQueryChanged) {
        emit(SearchNewsLoading());
        final _searchNewsResuts =
            await _newsRepository.getSearchNews(event.query);
        try {
          if (_searchNewsResuts != null) {
            emit(SearchNewsLoadedSuccess(
                newsResults: List<Article>.from(_searchNewsResuts)));
          } else {
            return;
          }
        } catch (e) {
          emit(SearchNewsFailed(error: e.toString()));
        }
      }
    });
  }

  final NewsRepository _newsRepository;
}
