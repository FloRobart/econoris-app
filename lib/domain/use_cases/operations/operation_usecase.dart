import 'package:econoris_app/data/repositories/operations/operation_repository.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Fournit une instance de [OperationUseCase].
final operationUseCaseProvider = Provider<OperationUseCase>((ref) {
  final operationRepository = ref.read(operationRepositoryProvider);

  return OperationUseCase(operationRepository: operationRepository);
});

/// Use case class for the home screen
class OperationUseCase {
  OperationUseCase({required this.operationRepository});

  final OperationRepository operationRepository;

  /*=====*/
  /* GET */
  /*=====*/
  /// Fetches the operations whose levy day is between [startDate] and [endDate], both included.
  /// Without one of its bounds, the period has no start or no end.
  Future<List<Operation>> getOperations({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return operationRepository.getOperations(
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Fetches the levy day of the oldest operation of the user, null if the user has none.
  Future<DateTime?> getOldestOperationDate() {
    return operationRepository.getOldestOperationDate();
  }

  /*======*/
  /* POST */
  /*======*/
  Future<Operation> addOperation(OperationCreate body) {
    return operationRepository.addOperation(body);
  }

  /*=====*/
  /* PUT */
  /*=====*/
  Future<Operation> updateOperation(int id, Operation body) {
    return operationRepository.updateOperation(id, body);
  }

  /*========*/
  /* DELETE */
  /*========*/
  Future<Operation> deleteOperation(int id) {
    return operationRepository.deleteOperation(id);
  }
}
