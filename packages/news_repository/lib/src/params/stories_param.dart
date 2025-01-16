import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/params.dart';

part 'stories_param.g.dart';

/// Stories class
@JsonSerializable()
class StoriesParam extends BaseParam {
  /// {@macro constructor}
  const StoriesParam({
    this.search,
    this.searchFields,
    super.locale,
    super.domains,
    super.excludeDomains,
    super.sourceIds,
    super.excludeSourceIds,
    super.categories,
    super.excludeCategories,
    super.language,
    super.publishedBefore,
    super.publishedAfter,
    super.publishedOn,
    super.sort,
    super.limit,
    super.page,
  });

  /// Parse JSON to object class
  factory StoriesParam.fromJson(Map<String, dynamic> json) =>
      _$StoriesParamFromJson(json);

  /// basic search with some rules :
  /// + signifies AND operation use +
  /// + signifies OR operation use |
  /// + negates a single token use -
  /// + wraps a number of tokens to signify a phrase for searching use "
  /// + at the end of a term signifies a prefix query use *
  /// + signify precedence use ( and )
  final String? search;

  /// search field, comma separated
  @JsonKey(name: 'search_fields')
  final String? searchFields;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$StoriesParamToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [search, searchFields];
}
