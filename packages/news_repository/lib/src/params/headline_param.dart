import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/base_param.dart';

part 'headline_param.g.dart';

/// Headline param
@JsonSerializable()
class HeadlineParam extends BaseParam {
  /// {macro constructor}
  const HeadlineParam({
    this.headlinesPerCategory,
    this.includeSimilar,
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

  /// Convert JSON to object class
  factory HeadlineParam.fromJson(Map<String, dynamic> json) =>
      _$HeadlineParamFromJson(json);

  /// number of article, max is 10 and default is 6
  @JsonKey(name: 'headlines_per_category')
  final String? headlinesPerCategory;

  /// include similar article or not, default is true
  @JsonKey(name: 'include_similar')
  final bool? includeSimilar;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$HeadlineParamToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [headlinesPerCategory, includeSimilar];
}
