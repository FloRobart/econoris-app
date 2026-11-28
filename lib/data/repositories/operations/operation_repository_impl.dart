import 'package:econoris_app/data/models/operations/operation_dto.dart';
import 'package:econoris_app/data/models/operations/operation_dto_mapper.dart';
import 'package:econoris_app/data/repositories/operations/operation_repository.dart';
import 'package:econoris_app/data/repositories/operations/operation_repository_local.dart';
import 'package:econoris_app/data/repositories/operations/operation_repository_remote.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create_mapper.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/domain/models/operations/operation_mapper.dart';
import 'package:econoris_app/ui/core/ui/utils/operation_sort.dart';

/// Repository interface for operations data.
class OperationRepositoryImpl implements OperationRepository {
  final OperationRepositoryRemote remote;
  final OperationRepositoryLocal local;

  OperationRepositoryImpl({required this.remote, required this.local});

  /// Fetches the operations whose levy day is in the period from the remote API.
  /// Both bounds are optional and included.
  @override
  Future<List<Operation>> getOperations({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    List<OperationDto> operationsDtoList = [];
    try {
      operationsDtoList = await remote.getOperations(
        startDate: _formatApiDay(startDate),
        endDate: _formatApiDay(endDate),
      );
      // local.saveOperations(operationsDtoList);
    } catch (_) {
      // operationsDtoList = await local.getOperations();
      rethrow;
    }

    return operationsDtoList
        .map((operationDto) => operationDto.toDomain())
        .toList()
      ..sort(operationSort);
  }

  /// Fetches the levy day of the oldest operation from the remote API, null if the user has no operation.
  @override
  Future<DateTime?> getOldestOperationDate() async {
    final oldestOperationDay = await remote.getOldestOperationDate();
    if (oldestOperationDay == null) return null;

    return DateTime.parse(oldestOperationDay);
  }

  /// Adds a new operation to the remote API.
  @override
  Future<Operation> addOperation(OperationCreate body) async {
    try {
      final operationCreateDto = body.toDto();
      final repOperationDto = await remote.addOperation(operationCreateDto);
      // local.addOperation(repOperationDto);
      return repOperationDto.toDomain();
    } catch (e) {
      rethrow;
    }
  }

  /// Updates an existing operation in the remote API.
  @override
  Future<Operation> updateOperation(int id, Operation body) async {
    try {
      final operationDto = body.toDto();
      final repOperationDto = await remote.updateOperation(id, operationDto);
      // local.updateOperation(id, repOperationDto);
      return repOperationDto.toDomain();
    } catch (_) {
      rethrow;
    }
  }

  /// Deletes an operation from the remote API.
  @override
  Future<Operation> deleteOperation(int id) async {
    try {
      final operationDto = await remote.deleteOperation(id);
      // local.deleteOperation(id);
      return operationDto.toDomain();
    } catch (_) {
      rethrow;
    }
  }

  /// Formats a day the way the API reads it, "yyyy-MM-dd", whatever the locale of the device.
  static String? _formatApiDay(DateTime? day) {
    if (day == null) return null;

    final month = day.month.toString().padLeft(2, '0');
    final dayOfMonth = day.day.toString().padLeft(2, '0');
    return '${day.year}-$month-$dayOfMonth';
  }
}
