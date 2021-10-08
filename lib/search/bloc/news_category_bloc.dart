import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_repository/news_repository.dart';

part 'news_category_event.dart';
part 'news_category_state.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  NewsCategoryBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(NewsCategoryInitial()) {
    on<NewsCategoryEvent>((event, emit) async {
      if (event is NewsCategoryChanged) {
        emit(NewsCategoryLoading());
        try {
          final _articleCategoryResult = await _newsRepository
              .getTopHeadlineNews(event.countryCode, event.categoryType);
          if (_articleCategoryResult != null) {
            emit(NewsCategoryLoadedSuccess(
                categoryArticles: List<Article>.from(_articleCategoryResult)));
          } else {
            emit(
                const NewsCategoryLoadedSuccess(categoryArticles: <Article>[]));
          }
        } catch (e) {
          emit(NewsCategoryFailed(error: e.toString()));
        }
      }
    });
  }
  final NewsRepository _newsRepository;
}
