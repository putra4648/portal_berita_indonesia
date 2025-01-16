import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/params.dart';

part 'stories_param.g.dart';

/// Stories class
@JsonSerializable()
class StoriesParam extends BaseParam {
  /// {@macro constructor}
  StoriesParam();

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
  String? search;

  /// search field, comma separated
  @JsonKey(name: 'search_fields')
  String? searchFields;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$StoriesParamToJson(this);
}
