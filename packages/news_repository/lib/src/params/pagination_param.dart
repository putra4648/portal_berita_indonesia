import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_param.g.dart';

/// Pagination param
@JsonSerializable()
class PaginationParam extends Equatable {
  /// {@macro constructor}
  const PaginationParam({
    this.sort,
    this.limit,
    this.page,
  });

  /// Parse JSON to object class
  factory PaginationParam.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamFromJson(json);

  /// sort from parameter key
  final String? sort;

  /// based on API plan
  final int? limit;

  /// page to get, default is 1
  final int? page;

  /// Convert this class to JSON object
  Map<String, dynamic> toJson() => _$PaginationParamToJson(this);

  @override
  List<Object?> get props => [sort, limit, page];
}
