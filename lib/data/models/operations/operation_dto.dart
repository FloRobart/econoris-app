import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_dto.freezed.dart';
part 'operation_dto.g.dart';

@freezed
abstract class OperationDto with _$OperationDto {
  const factory OperationDto({
    required int id,
    @JsonKey(name: 'levy_date') required String levyDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    required double costs,
    @JsonKey(name: 'is_validate') required bool isValidate,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'subscription_id') required int? subscriptionId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _OperationDto;

  factory OperationDto.fromJson(Map<String, dynamic> json) =>
      _$OperationDtoFromJson(json);
}
