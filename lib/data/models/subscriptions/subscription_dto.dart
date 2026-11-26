import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

@freezed
abstract class SubscriptionDto with _$SubscriptionDto {
  const factory SubscriptionDto({
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
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String? endDate,
    @JsonKey(name: 'day_of_month') required int dayOfMonth,
    @JsonKey(name: 'last_generated_at') required String? lastGeneratedAt,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _SubscriptionDto;

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoFromJson(json);
}
