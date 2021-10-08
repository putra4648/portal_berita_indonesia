part of 'breaking_news_bloc.dart';

abstract class BreakingNewsState extends Equatable {
  const BreakingNewsState({
    this.breakingNewsArticles = const [],
    this.error = '',
  });

  final String error;
  final List<Article> breakingNewsArticles;

  @override
  List<Object> get props => [error, breakingNewsArticles];
}

class BreakingNewsInitial extends BreakingNewsState {}

class BreakingNewsLoading extends BreakingNewsState {}

class BreakingNewsLoadedSuccess extends BreakingNewsState {
  const BreakingNewsLoadedSuccess({required List<Article> breakingNewsArticles})
      : super(breakingNewsArticles: breakingNewsArticles);
}

class BreakingNewsFailed extends BreakingNewsState {
  const BreakingNewsFailed({required String error}) : super(error: error);
}
