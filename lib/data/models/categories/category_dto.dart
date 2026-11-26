import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

/// A category as sent by the API (GET /categories), with its sub-categories.
@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required int id,
    required String code,
    required String label,
    @JsonKey(name: 'parent_id') required int? parentId,
    @JsonKey(name: 'search_keywords')
    @Default(<String>[])
    List<String> searchKeywords,
    @Default(<CategoryDto>[]) List<CategoryDto> children,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
