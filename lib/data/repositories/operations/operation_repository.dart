import 'package:econoris_app/data/services/api/operations/operation_api_client.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/data/repositories/operations/operation_repository_impl.dart';
import 'package:econoris_app/data/repositories/operations/operation_repository_local.dart';
import 'package:econoris_app/data/repositories/operations/operation_repository_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Fournit une instance asynchrone d'[OperationRepository].
final operationRepositoryProvider = Provider<OperationRepository>((ref) {
  final remote = OperationRepositoryRemote(
    operationApiClient: ref.read(operationApiClientProvider),
  );
  final local = OperationRepositoryLocal();

  return OperationRepositoryImpl(remote: remote, local: local);
});

/// Repository interface for operations data.
abstract class OperationRepository {
  Future<List<Operation>> getOperations({
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<DateTime?> getOldestOperationDate();
  Future<Operation> addOperation(OperationCreate body);
  Future<Operation> updateOperation(int id, Operation body);
  Future<Operation> deleteOperation(int id);
}
