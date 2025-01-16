import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/base_param.dart';

part 'headline_param.g.dart';

/// Headline param
@JsonSerializable()
class HeadlineParam extends BaseParam {
  /// {macro constructor}
  HeadlineParam();
  
  /// Convert JSON to object class
  factory HeadlineParam.fromJson(Map<String, dynamic> json) =>
      _$HeadlineParamFromJson(json);

  /// number of article, max is 10 and default is 6
  @JsonKey(name: 'headlines_per_category')
  String? headlinesPerCategory;

  /// include similar article or not, default is true
  @JsonKey(name: 'include_similar')
  bool? includeSimilar;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$HeadlineParamToJson(this);
}
