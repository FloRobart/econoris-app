import 'package:econoris_app/data/models/operations/create/operation_create_dto.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';

extension OperationCreateMapper on OperationCreate {
  OperationCreateDto toDto() {
    return OperationCreateDto(
      levyDate: levyDate.toIso8601String(),
      label: label,
      amount: amount,
      categoryId: categoryId,
      isValidate: isValidate,
    );
  }
}
