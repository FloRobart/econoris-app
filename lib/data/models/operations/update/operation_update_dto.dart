import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_update_dto.freezed.dart';
part 'operation_update_dto.g.dart';

@freezed
abstract class OperationUpdateDto with _$OperationUpdateDto {
  const factory OperationUpdateDto({
    required int id,
    @JsonKey(name: 'levy_date') required String levyDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    @Default(0.0) double costs,
    @JsonKey(name: 'is_validate') @Default(true) bool isValidate,
  }) = _OperationUpdateDto;

  factory OperationUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$OperationUpdateDtoFromJson(json);
}
