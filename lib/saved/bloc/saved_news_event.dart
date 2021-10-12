part of 'saved_news_bloc.dart';

abstract class SavedNewsEvent extends Equatable {
  const SavedNewsEvent();

  @override
  List<Object> get props => [];
}

class SavedNewsLoaded extends SavedNewsEvent {}

class SavedNewsAdded extends SavedNewsEvent {
  const SavedNewsAdded({required this.article});

  final Article article;

  @override
  List<Object> get props => [article];
}

class SavedNewsDeleted extends SavedNewsEvent {
  const SavedNewsDeleted({required this.article});

  final Article article;

  @override
  List<Object> get props => [article];
}
