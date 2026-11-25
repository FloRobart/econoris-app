import 'package:econoris_app/data/models/operations/create/operation_create_dto.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';

extension OperationCreateDtoMapper on OperationCreateDto {
  OperationCreate toDomain() {
    return OperationCreate(
      levyDate: DateTime.parse(levyDate),
      label: label,
      amount: amount,
      categoryId: categoryId,
      isValidate: isValidate,
    );
  }
}
