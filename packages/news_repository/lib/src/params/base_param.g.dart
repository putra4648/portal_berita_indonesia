// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseParam _$BaseParamFromJson(Map<String, dynamic> json) => BaseParam()
  ..sort = json['sort'] as String?
  ..limit = (json['limit'] as num?)?.toInt()
  ..page = (json['page'] as num?)?.toInt()
  ..locale = json['locale'] as String?
  ..domains = json['domains'] as String?
  ..excludeDomains = json['exclude_domains'] as String?
  ..sourceIds = json['source_ids'] as String?
  ..excludeSourceIds = json['exclude_source_ids'] as String?
  ..categories = json['categories'] as String?
  ..excludeCategories = json['exclude_categories'] as String?
  ..language = json['language'] as String?
  ..publishedBefore = json['published_before'] as String?
  ..publishedAfter = json['published_after'] as String?
  ..publishedOn = json['published_on'] as String?;

Map<String, dynamic> _$BaseParamToJson(BaseParam instance) => <String, dynamic>{
      'sort': instance.sort,
      'limit': instance.limit,
      'page': instance.page,
      'locale': instance.locale,
      'domains': instance.domains,
      'exclude_domains': instance.excludeDomains,
      'source_ids': instance.sourceIds,
      'exclude_source_ids': instance.excludeSourceIds,
      'categories': instance.categories,
      'exclude_categories': instance.excludeCategories,
      'language': instance.language,
      'published_before': instance.publishedBefore,
      'published_after': instance.publishedAfter,
      'published_on': instance.publishedOn,
    };
