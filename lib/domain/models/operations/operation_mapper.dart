import 'package:econoris_app/data/models/operations/operation_dto.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';

extension OperationMapper on Operation {
  OperationDto toDto() {
    return OperationDto(
      id: id,
      levyDate: levyDate.toIso8601String(),
      label: label,
      amount: amount,
      categoryId: categoryId,
      source: source,
      destination: destination,
      costs: costs,
      isValidate: isValidate,
      userId: userId,
      subscriptionId: subscriptionId,
      createdAt: createdAt.toIso8601String(),
      updatedAt: updatedAt.toIso8601String(),
    );
  }
}
