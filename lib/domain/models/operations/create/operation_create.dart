import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_create.freezed.dart';

@freezed
abstract class OperationCreate with _$OperationCreate {
  const factory OperationCreate({
    @JsonKey(name: 'levy_date') required DateTime levyDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'is_validate') @Default(false) bool isValidate,
  }) = _OperationCreate;
}
