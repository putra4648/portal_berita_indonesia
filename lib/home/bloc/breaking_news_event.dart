part of 'breaking_news_bloc.dart';

abstract class BreakingNewsEvent extends Equatable {
  const BreakingNewsEvent();

  @override
  List<Object> get props => [];
}

class BreakingNewsFetched extends BreakingNewsEvent {}

class BreakingNewsRefresh extends BreakingNewsEvent {}
