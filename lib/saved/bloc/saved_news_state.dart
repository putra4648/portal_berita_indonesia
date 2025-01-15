part of 'saved_news_bloc.dart';

class SavedNewsState extends Equatable {
  const SavedNewsState(
      {this.savedArticles = const <Article>[], this.error = ''});

  /// Mapping to class
  factory SavedNewsState.fromMap(Map<String, dynamic> map) {
    return SavedNewsState(
      savedArticles: map['savedArticles'] != null
          ? List<Article>.from((map['savedArticles'] as List)
              .cast<Map<String, dynamic>>()
              .map<Article>(Article.fromMap))
          : [],
    );
  }

  /// Converting fromMap method to
  factory SavedNewsState.fromJson(String source) =>
      SavedNewsState.fromMap(json.decode(source) as Map<String, dynamic>);

  final List<Article> savedArticles;
  final String error;

  @override
  List<Object> get props => [savedArticles, error];

  SavedNewsState copyWith({
    List<Article>? savedArticles,
    String? error,
  }) {
    return SavedNewsState(
      savedArticles: savedArticles ?? this.savedArticles,
      error: error ?? this.error,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, Object?> toMap() {
    return {
      'savedArticles': savedArticles.map((x) => x.toMap()).toList(),
    };
  }
}
