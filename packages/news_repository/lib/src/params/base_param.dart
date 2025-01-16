import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/pagination_param.dart';

part 'base_param.g.dart';

/// Base parram for each API request
/// default to nullable
@JsonSerializable()
class BaseParam extends PaginationParam {
  /// Default constructor
  BaseParam();

  /// Parse JSON to object class
  factory BaseParam.fromJson(Map<String, dynamic> json) =>
      _$BaseParamFromJson(json);

  /// user locale location, default is ALL
  String? locale;

  /// domain can be get from Sources location, comma separated
  String? domains;

  /// excluded domain can be get from Sources location, comma separated
  @JsonKey(name: 'exclude_domains')
  String? excludeDomains;

  /// source_id can be get from Sources location, comma separated
  @JsonKey(name: 'source_ids')
  String? sourceIds;

  /// excluding source_id can be get from Sources location, comma separated,
  /// optional
  @JsonKey(name: 'exclude_source_ids')
  String? excludeSourceIds;

  /// source_id can be get from Sources location, comma separated
  String? categories;

  /// excluding source_id can be get from Sources location, comma separated,
  /// optional
  @JsonKey(name: 'exclude_categories')
  String? excludeCategories;

  /// user defined language, default is ALL
  String? language;

  /// Supported formats include: Y-m-d\TH:i:s | Y-m-d\TH:i | Y-m-d\TH | Y-m-d | Y-m | Y.
  @JsonKey(name: 'published_before')
  String? publishedBefore;

  /// Supported formats include: Y-m-d\TH:i:s | Y-m-d\TH:i | Y-m-d\TH | Y-m-d | Y-m | Y.
  @JsonKey(name: 'published_after')
  String? publishedAfter;

  /// date published, format: yyyy-MM-dd
  @JsonKey(name: 'published_on')
  String? publishedOn;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$BaseParamToJson(this);
}
