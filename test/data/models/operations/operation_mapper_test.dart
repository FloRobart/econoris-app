import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/data/models/operations/operation_dto.dart';
import 'package:econoris_app/data/models/operations/operation_dto_mapper.dart';
import 'package:econoris_app/domain/models/operations/operation_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Raw JSON as returned by the API
  final Map<String, dynamic> operationJson = {
    'id': 1,
    'levy_date': '2026-10-15T00:00:00.000',
    'label': 'Courses du mois',
    'amount': -85.5,
    'category_id': 49,
    'source': null,
    'destination': 'Supermarché',
    'costs': 0.0,
    'is_validate': true,
    'user_id': 42,
    'subscription_id': null,
    'created_at': '2026-10-15T10:30:00.000',
    'updated_at': '2026-10-16T08:00:00.000',
  };

  group('OperationDto.fromJson', () {
    test('parses snake_case keys into the DTO fields', () {
      final operationDto = OperationDto.fromJson(operationJson);

      expect(operationDto.id, 1);
      expect(operationDto.levyDate, '2026-10-15T00:00:00.000');
      expect(operationDto.amount, -85.5);
      expect(operationDto.isValidate, isTrue);
      expect(operationDto.userId, 42);
      expect(operationDto.subscriptionId, isNull);
    });
  });

  group('OperationDtoMapper.toDomain', () {
    test('converts date strings into DateTime objects', () {
      final operation = OperationDto.fromJson(operationJson).toDomain();

      expect(operation.levyDate, DateTime(2026, 10, 15));
      expect(operation.createdAt, DateTime(2026, 10, 15, 10, 30));
      expect(operation.updatedAt, DateTime(2026, 10, 16, 8));
    });

    test('applies the default selection state', () {
      final operation = OperationDto.fromJson(operationJson).toDomain();

      expect(operation.isSelected, Constantes.isOperationSelected);
    });
  });

  group('OperationMapper.toDto', () {
    test('round trip DTO -> domain -> DTO keeps the same values', () {
      final originalDto = OperationDto.fromJson(operationJson);

      final roundTripDto = originalDto.toDomain().toDto();

      expect(roundTripDto, originalDto);
    });
  });
}
