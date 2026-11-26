// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionUpdateDto _$SubscriptionUpdateDtoFromJson(
  Map<String, dynamic> json,
) => _SubscriptionUpdateDto(
  id: (json['id'] as num).toInt(),
  startDate: json['start_date'] as String,
  label: json['label'] as String,
  amount: (json['amount'] as num).toDouble(),
  categoryId: (json['category_id'] as num).toInt(),
  source: json['source'] as String?,
  destination: json['destination'] as String?,
  costs: (json['costs'] as num?)?.toDouble() ?? 0.0,
  active: json['active'] as bool,
  intervalValue: (json['interval_value'] as num).toInt(),
  intervalUnit: json['interval_unit'] as String,
  dayOfMonth: (json['day_of_month'] as num).toInt(),
);

Map<String, dynamic> _$SubscriptionUpdateDtoToJson(
  _SubscriptionUpdateDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'start_date': instance.startDate,
  'label': instance.label,
  'amount': instance.amount,
  'category_id': instance.categoryId,
  'source': instance.source,
  'destination': instance.destination,
  'costs': instance.costs,
  'active': instance.active,
  'interval_value': instance.intervalValue,
  'interval_unit': instance.intervalUnit,
  'day_of_month': instance.dayOfMonth,
};
