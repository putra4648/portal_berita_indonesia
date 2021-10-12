part of 'recommendation_news_bloc.dart';

class RecommendationNewsState extends Equatable {
  const RecommendationNewsState({this.recommendedArticles = const []});

  final List<Article> recommendedArticles;

  @override
  List<Object> get props => [recommendedArticles];
}
