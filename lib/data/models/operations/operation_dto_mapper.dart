import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/data/models/operations/operation_dto.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';

extension OperationDtoMapper on OperationDto {
  Operation toDomain() {
    return Operation(
      id: id,
      levyDate: DateTime.parse(levyDate),
      label: label,
      amount: amount,
      categoryId: categoryId,
      source: source,
      destination: destination,
      costs: costs,
      isValidate: isValidate,
      userId: userId,
      subscriptionId: subscriptionId,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      isSelected: Constantes.isOperationSelected,
    );
  }
}
