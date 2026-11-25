// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    _SubscriptionDto(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num).toInt(),
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      costs: (json['costs'] as num).toDouble(),
      active: json['active'] as bool,
      intervalValue: (json['interval_value'] as num).toInt(),
      intervalUnit: json['interval_unit'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      dayOfMonth: (json['day_of_month'] as num).toInt(),
      lastGeneratedAt: json['last_generated_at'] as String?,
      userId: (json['user_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$SubscriptionDtoToJson(_SubscriptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'amount': instance.amount,
      'category_id': instance.categoryId,
      'source': instance.source,
      'destination': instance.destination,
      'costs': instance.costs,
      'active': instance.active,
      'interval_value': instance.intervalValue,
      'interval_unit': instance.intervalUnit,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'day_of_month': instance.dayOfMonth,
      'last_generated_at': instance.lastGeneratedAt,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
