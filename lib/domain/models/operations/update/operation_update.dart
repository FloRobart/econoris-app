import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_update.freezed.dart';

@freezed
abstract class OperationUpdate with _$OperationUpdate {
  const factory OperationUpdate({
    required int id,
    @JsonKey(name: 'levy_date') required DateTime levyDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    @Default(0.0) double costs,
    @JsonKey(name: 'is_validate') @Default(true) bool isValidate,
  }) = _OperationUpdate;
}
