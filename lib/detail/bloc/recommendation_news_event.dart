part of 'recommendation_news_bloc.dart';

abstract class RecommendationNewsEvent extends Equatable {
  const RecommendationNewsEvent({
    this.page = 1,
  });

  final int page;

  @override
  List<Object> get props => [page];
}

class RecommendedNewsGenerated extends RecommendationNewsEvent {
  const RecommendedNewsGenerated({
    required int page,
  }) : super(page: page);
}
