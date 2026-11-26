// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OperationUpdateDto _$OperationUpdateDtoFromJson(Map<String, dynamic> json) =>
    _OperationUpdateDto(
      id: (json['id'] as num).toInt(),
      levyDate: json['levy_date'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num).toInt(),
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      costs: (json['costs'] as num?)?.toDouble() ?? 0.0,
      isValidate: json['is_validate'] as bool? ?? true,
    );

Map<String, dynamic> _$OperationUpdateDtoToJson(_OperationUpdateDto instance) =>
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
    };
