part of 'saved_news_bloc.dart';

abstract class SavedNewsEvent extends Equatable {
  const SavedNewsEvent(this.article);

  final Article article;
  @override
  List<Object> get props => [article];
}

class SavedNewsAdded extends SavedNewsEvent {
  const SavedNewsAdded({required Article article}) : super(article);
}

class SavedNewsDeleted extends SavedNewsEvent {
  const SavedNewsDeleted({required Article article}) : super(article);
}
