part of 'breaking_news_bloc.dart';

class BreakingNewsState extends Equatable {
  const BreakingNewsState({
    this.breakingNewsArticles = const [],
    this.error = '',
    this.isLoading = true,
  });

  final String error;
  final bool isLoading;
  final List<Article> breakingNewsArticles;

  @override
  List<Object> get props => [error, isLoading, breakingNewsArticles];

  BreakingNewsState copyWith({
    String? error,
    bool? isLoading,
    List<Article>? breakingNewsArticles,
  }) {
    return BreakingNewsState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      breakingNewsArticles: breakingNewsArticles ?? this.breakingNewsArticles,
    );
  }
}
