import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_create_dto.freezed.dart';
part 'operation_create_dto.g.dart';

@freezed
abstract class OperationCreateDto with _$OperationCreateDto {
  const factory OperationCreateDto({
    @JsonKey(name: 'levy_date') required String levyDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'is_validate') @Default(true) bool isValidate,
  }) = _OperationCreateDto;

  factory OperationCreateDto.fromJson(Map<String, dynamic> json) =>
      _$OperationCreateDtoFromJson(json);
}
