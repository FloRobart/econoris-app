import 'package:econoris_app/data/models/operations/create/operation_create_dto.dart';
import 'package:econoris_app/data/models/operations/operation_dto.dart';
import 'package:econoris_app/data/services/api/operations/operation_api_client.dart';

/// Repository interface for operations data.
class OperationRepositoryRemote {
  const OperationRepositoryRemote({required this.operationApiClient});

  final OperationApiClient operationApiClient;

  /// Fetches the operations of the period from the remote API.
  /// Both bounds are optional and included, as days "yyyy-MM-dd".
  Future<List<OperationDto>> getOperations({
    String? startDate,
    String? endDate,
  }) async {
    final operationsDtoList = await operationApiClient.getOperations(
      startDate: startDate,
      endDate: endDate,
    );
    return operationsDtoList
        .map((operation) => OperationDto.fromJson(operation))
        .toList();
  }

  /// Fetches the levy day of the oldest operation from the remote API, as "yyyy-MM-dd".
  Future<String?> getOldestOperationDate() {
    return operationApiClient.getOldestOperationDate();
  }

  /// Adds a new operation to the remote API.
  Future<OperationDto> addOperation(OperationCreateDto body) async {
    final operation = await operationApiClient.addOperation(body.toJson());
    return OperationDto.fromJson(operation);
  }

  /// Updates an existing operation in the remote API.
  Future<OperationDto> updateOperation(int id, OperationDto body) async {
    final operation = await operationApiClient.updateOperation(
      id,
      body.toJson(),
    );
    return OperationDto.fromJson(operation);
  }

  /// Deletes an operation from the remote API.
  Future<OperationDto> deleteOperation(int id) async {
    final operation = await operationApiClient.deleteOperation(id);
    return OperationDto.fromJson(operation);
  }
}
