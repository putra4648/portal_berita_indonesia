import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/params.dart';

part 'stories_pararm.g.dart';

/// Stories class
@JsonSerializable()
class StoriesPararm extends BaseParam {
  /// {macro constructor}
  StoriesPararm({required this.search, required this.searchFields});

  /// {macro constructor}
  ///

  /// basic search with some rules :
  /// + signifies AND operation use +
  /// + signifies OR operation use |
  /// + negates a single token use -
  /// + wraps a number of tokens to signify a phrase for searching use "
  /// + at the end of a term signifies a prefix query use *
  /// + signify precedence use ( and )
  final String search;

  /// search field, comma separated
  @JsonKey(name: 'search_fields')
  final String searchFields;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$StoriesPararmToJson(this);
}
