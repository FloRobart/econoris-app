import 'package:econoris_app/data/models/operations/update/operation_update_dto.dart';
import 'package:econoris_app/domain/models/operations/update/operation_update.dart';

extension OperationUpdateDtoMapper on OperationUpdateDto {
  OperationUpdate toDomain() {
    return OperationUpdate(
      id: id,
      levyDate: DateTime.parse(levyDate),
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
