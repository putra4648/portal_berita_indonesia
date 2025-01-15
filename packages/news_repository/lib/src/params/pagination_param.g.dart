// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationParam _$PaginationParamFromJson(Map<String, dynamic> json) =>
    PaginationParam()
      ..sort = json['sort'] as String?
      ..limit = (json['limit'] as num?)?.toInt()
      ..page = (json['page'] as num?)?.toInt();

Map<String, dynamic> _$PaginationParamToJson(PaginationParam instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'limit': instance.limit,
      'page': instance.page,
    };
