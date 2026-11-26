// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OperationDto _$OperationDtoFromJson(Map<String, dynamic> json) =>
    _OperationDto(
      id: (json['id'] as num).toInt(),
      levyDate: json['levy_date'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num).toInt(),
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      costs: (json['costs'] as num).toDouble(),
      isValidate: json['is_validate'] as bool,
      userId: (json['user_id'] as num).toInt(),
      subscriptionId: (json['subscription_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$OperationDtoToJson(_OperationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'levy_date': instance.levyDate,
      'label': instance.label,
      'amount': instance.amount,
      'category_id': instance.categoryId,
      'source': instance.source,
      'destination': instance.destination,
      'costs': instance.costs,
      'is_validate': instance.isValidate,
      'user_id': instance.userId,
      'subscription_id': instance.subscriptionId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
