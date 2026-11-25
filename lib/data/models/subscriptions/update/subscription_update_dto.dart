import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_update_dto.freezed.dart';
part 'subscription_update_dto.g.dart';

@freezed
abstract class SubscriptionUpdateDto with _$SubscriptionUpdateDto {
  const factory SubscriptionUpdateDto({
    required int id,
    @JsonKey(name: 'start_date') required String startDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required String? source,
    required String? destination,
    @Default(0.0) double costs,
    required bool active,
    @JsonKey(name: 'interval_value') required int intervalValue,
    @JsonKey(name: 'interval_unit') required String intervalUnit,
    @JsonKey(name: 'day_of_month') required int dayOfMonth,
  }) = _SubscriptionUpdateDto;

  factory SubscriptionUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionUpdateDtoFromJson(json);
}
