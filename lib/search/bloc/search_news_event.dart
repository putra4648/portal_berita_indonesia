part of 'search_news_bloc.dart';

abstract class SearchNewsEvent extends Equatable {
  const SearchNewsEvent({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}

class SearchNewsQueryChanged extends SearchNewsEvent {
  const SearchNewsQueryChanged({required String query}) : super(query: query);
}
