import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_create_dto.freezed.dart';
part 'subscription_create_dto.g.dart';

@freezed
abstract class SubscriptionCreateDto with _$SubscriptionCreateDto {
  const factory SubscriptionCreateDto({
    @JsonKey(name: 'start_date') required String startDate,
    required String label,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    required bool active,
    @JsonKey(name: 'interval_value') required int intervalValue,
    @JsonKey(name: 'interval_unit') required String intervalUnit,
    @JsonKey(name: 'day_of_month') required int dayOfMonth,
  }) = _SubscriptionCreateDto;

  factory SubscriptionCreateDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionCreateDtoFromJson(json);
}
