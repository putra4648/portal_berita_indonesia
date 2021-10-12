part of 'search_news_bloc.dart';

abstract class SearchNewsState extends Equatable {
  const SearchNewsState({
    this.newsResults = const [],
    this.error = '',
  });

  final List<Article> newsResults;
  final String error;

  @override
  List<Object> get props => [error, newsResults];
}

class SearchNewsInitial extends SearchNewsState {}

class SearchNewsLoading extends SearchNewsState {}

class SearchNewsLoadedSuccess extends SearchNewsState {
  const SearchNewsLoadedSuccess({required List<Article> newsResults})
      : super(newsResults: newsResults);
}

class SearchNewsFailed extends SearchNewsState {
  const SearchNewsFailed({required String error}) : super(error: error);
}
