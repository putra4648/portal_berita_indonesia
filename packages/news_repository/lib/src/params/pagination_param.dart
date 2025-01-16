import 'package:json_annotation/json_annotation.dart';

part 'pagination_param.g.dart';

/// Pagination param
@JsonSerializable()
class PaginationParam {
  /// {@macro constructor}
  PaginationParam();

  /// Parse JSON to object class
  factory PaginationParam.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamFromJson(json);

  /// sort from parameter key
  String? sort;

  /// based on API plan
  int? limit;

  /// page to get, default is 1
  int? page;

  /// Convert this class to JSON object
  Map<String, dynamic> toJson() => _$PaginationParamToJson(this);
}
