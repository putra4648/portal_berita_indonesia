part of 'news_category_bloc.dart';

@immutable
abstract class NewsCategoryState extends Equatable {
  const NewsCategoryState({this.categoryArticles = const [], this.error = ''});

  final List<Article> categoryArticles;
  final String error;

  @override
  List<Object> get props => [categoryArticles, error];
}

class NewsCategoryInitial extends NewsCategoryState {}

class NewsCategoryLoading extends NewsCategoryState {}

class NewsCategoryLoadedSuccess extends NewsCategoryState {
  const NewsCategoryLoadedSuccess({required List<Article> categoryArticles})
      : super(categoryArticles: categoryArticles);
}

class NewsCategoryFailed extends NewsCategoryState {
  const NewsCategoryFailed({required String error}) : super(error: error);
}
