import 'package:econoris_app/data/models/operations/update/operation_update_dto.dart';
import 'package:econoris_app/domain/models/operations/update/operation_update.dart';

extension OperationUpdateMapper on OperationUpdate {
  OperationUpdateDto toDto() {
    return OperationUpdateDto(
      id: id,
      levyDate: levyDate.toIso8601String(),
      label: label,
      amount: amount,
      categoryId: categoryId,
      source: source,
      destination: destination,
      costs: costs,
      isValidate: isValidate,
    );
  }
}
