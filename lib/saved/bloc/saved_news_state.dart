part of 'saved_news_bloc.dart';

class SavedNewsState extends Equatable {
  const SavedNewsState({this.savedArticles = const <Article>[]});

  final List<Article> savedArticles;

  @override
  List<Object> get props => [savedArticles];

  SavedNewsState copyWith({
    List<Article>? savedArticles,
  }) {
    return SavedNewsState(
      savedArticles: savedArticles ?? this.savedArticles,
    );
  }

  factory SavedNewsState.fromMap(Map<String, dynamic> map) {
    return SavedNewsState(
      savedArticles: map['savedArticles'] != null
          ? List<Article>.from((map['savedArticles'] as List)
              .cast<Map<String, dynamic>>()
              .map<Article>((x) => Article.fromMap(x)))
          : [],
    );
  }

  factory SavedNewsState.fromJson(String source) =>
      SavedNewsState.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  Map<String, Object?> toMap() {
    return {
      'savedArticles': savedArticles.map((x) => x.toMap()).toList(),
    };
  }
}
