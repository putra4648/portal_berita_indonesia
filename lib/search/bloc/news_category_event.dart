part of 'news_category_bloc.dart';

@immutable
abstract class NewsCategoryEvent extends Equatable {
  const NewsCategoryEvent();

  @override
  List<Object> get props => [];
}

class NewsCategoryChanged extends NewsCategoryEvent {
  const NewsCategoryChanged({
    required this.countryCode,
    required this.categoryType,
  });

  final CountryCode countryCode;
  final CategoryType categoryType;

  @override
  List<Object> get props => [countryCode, categoryType];
}
