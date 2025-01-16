import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/params/pagination_param.dart';

part 'base_param.g.dart';

/// Base parram for each API request
/// default to nullable
@JsonSerializable()
class BaseParam extends PaginationParam {
  /// Default constructor
  const BaseParam({
    this.locale,
    this.domains,
    this.excludeDomains,
    this.sourceIds,
    this.excludeSourceIds,
    this.categories,
    this.excludeCategories,
    this.language,
    this.publishedBefore,
    this.publishedAfter,
    this.publishedOn,
    super.sort,
    super.limit,
    super.page,
  });

  /// Parse JSON to object class
  factory BaseParam.fromJson(Map<String, dynamic> json) =>
      _$BaseParamFromJson(json);

  /// user locale location, default is ALL
  final String? locale;

  /// domain can be get from Sources location, comma separated
  final String? domains;

  /// excluded domain can be get from Sources location, comma separated
  @JsonKey(name: 'exclude_domains')
  final String? excludeDomains;

  /// source_id can be get from Sources location, comma separated
  @JsonKey(name: 'source_ids')
  final String? sourceIds;

  /// excluding source_id can be get from Sources location, comma separated,
  /// optional
  @JsonKey(name: 'exclude_source_ids')
  final String? excludeSourceIds;

  /// categories can be get from Sources location, comma separated
  final List<String>? categories;

  /// excluding source_id can be get from Sources location, comma separated,
  /// optional
  @JsonKey(name: 'exclude_categories')
  final String? excludeCategories;

  /// user defined language, default is ALL
  final String? language;

  /// Supported formats include: Y-m-d\TH:i:s | Y-m-d\TH:i | Y-m-d\TH | Y-m-d | Y-m | Y.
  @JsonKey(name: 'published_before')
  final String? publishedBefore;

  /// Supported formats include: Y-m-d\TH:i:s | Y-m-d\TH:i | Y-m-d\TH | Y-m-d | Y-m | Y.
  @JsonKey(name: 'published_after')
  final String? publishedAfter;

  /// date published, format: yyyy-MM-dd
  @JsonKey(name: 'published_on')
  final String? publishedOn;

  /// Convert this class to JSON object
  @override
  Map<String, dynamic> toJson() => _$BaseParamToJson(this);

  @override
  List<Object?> get props => [
        locale,
        domains,
        excludeDomains,
        sourceIds,
        excludeSourceIds,
        categories,
        excludeCategories,
        language,
        publishedBefore,
        publishedAfter,
        publishedOn,
      ];
}
