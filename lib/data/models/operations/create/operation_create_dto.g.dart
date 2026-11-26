// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OperationCreateDto _$OperationCreateDtoFromJson(Map<String, dynamic> json) =>
    _OperationCreateDto(
      levyDate: json['levy_date'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num).toInt(),
      isValidate: json['is_validate'] as bool? ?? true,
    );

Map<String, dynamic> _$OperationCreateDtoToJson(_OperationCreateDto instance) =>
    <String, dynamic>{
      'levy_date': instance.levyDate,
      'label': instance.label,
      'amount': instance.amount,
      'category_id': instance.categoryId,
      'is_validate': instance.isValidate,
    };
