import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';

@freezed
abstract class Subscription with _$Subscription {
  const factory Subscription({
    required int id,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    required double costs,
    required bool active,
    @JsonKey(name: 'interval_value') required int intervalValue,
    @JsonKey(name: 'interval_unit') required String intervalUnit,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime? endDate,
    @JsonKey(name: 'day_of_month') required int dayOfMonth,
    @JsonKey(name: 'last_generated_at') required DateTime? lastGeneratedAt,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required bool isSelected,
  }) = _Subscription;
}
