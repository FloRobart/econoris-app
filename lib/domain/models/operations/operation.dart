import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation.freezed.dart';

@freezed
abstract class Operation with _$Operation {
  const factory Operation({
    required int id,
    @JsonKey(name: 'levy_date') required DateTime levyDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    required double costs,
    @JsonKey(name: 'is_validate') required bool isValidate,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'subscription_id') required int? subscriptionId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required bool isSelected,
  }) = _Operation;
}
