// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => _CategoryDto(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  label: json['label'] as String,
  parentId: (json['parent_id'] as num?)?.toInt(),
  searchKeywords:
      (json['search_keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CategoryDto>[],
);

Map<String, dynamic> _$CategoryDtoToJson(_CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'parent_id': instance.parentId,
      'search_keywords': instance.searchKeywords,
      'children': instance.children,
    };
