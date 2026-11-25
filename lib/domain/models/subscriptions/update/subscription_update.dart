import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_update.freezed.dart';

@freezed
abstract class SubscriptionUpdate with _$SubscriptionUpdate {
  const factory SubscriptionUpdate({
    required int id,
    @JsonKey(name: 'start_date') required DateTime startDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    @Default(0.0) double costs,
    @Default(true) bool active,
    required String recurrence,
  }) = _SubscriptionUpdate;
}

extension SubscriptionUpdateComputedFields on SubscriptionUpdate {
  int get dayOfMonth => startDate.day;
}
