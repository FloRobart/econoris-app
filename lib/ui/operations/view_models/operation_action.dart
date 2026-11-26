import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/domain/models/operations/update/operation_update.dart';
import 'package:econoris_app/ui/operations/widgets/operation_details.dart';
import 'package:econoris_app/ui/operations/widgets/operation_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OperationAction {
  OperationAction(this.deleteOperation, this.editOperation, this.context);

  final Future<void> Function(int id) deleteOperation;
  final Future<void> Function(Operation operation) editOperation;
  final BuildContext context;

  /// Affiche les détails d'une opération dans une bottom sheet.
  Future<void> showDetails(Operation operation) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => OperationDetails(
        operation: operation,
        onDeleteOperation: (id) => onDeleteOperation(id, 1),
        onEditOperation: onEditOperation,
      ),
    );
  }

  /// Affiche une boîte de dialogue de confirmation avant de supprimer une opération.
  Future<void> onDeleteOperation(int id, int layerNumber) async {
    try {
      final bool? shouldDelete = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          ThemeData theme = Theme.of(dialogContext);

          return AlertDialog(
            title: const Text('Confirmer la suppression'),
            content: const Text(
              'Cette opération sera supprimée définitivement.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  GoRouter.of(dialogContext).pop(false);
                },
                child: const Text('Annuler'),
              ),
              FilledButton(
                onPressed: () {
                  GoRouter.of(dialogContext).pop(true);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: theme.colorScheme.error,
                  foregroundColor: theme.colorScheme.onError,
                ),
                child: const Text('Supprimer'),
              ),
            ],
          );
        },
      );

      if (shouldDelete != true) {
        return;
      }

      await deleteOperation(id);

      if (context.mounted) {
        for (int i = 0; i < layerNumber; i++) {
          GoRouter.of(context).pop();
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Opération supprimée.')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Une erreur est survenue lors de la suppression de l\'opération.',
            ),
          ),
        );
      }
    }
  }

  Future<void> onEditOperation(Operation operation) async {
    try {
      if (context.mounted) {
        GoRouter.of(context).pop();
      }

      final OperationUpdate? operationUpdate =
          await showModalBottomSheet<OperationUpdate>(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) =>
                OperationCreateForm(initialOperation: operation),
          );

      if (operationUpdate == null) {
        return;
      }

      final updatedOperation = operation.copyWith(
        levyDate: operationUpdate.levyDate,
        label: operationUpdate.label,
        amount: operationUpdate.amount,
        categoryId: operationUpdate.categoryId,
        source: operationUpdate.source,
        destination: operationUpdate.destination,
        costs: operationUpdate.costs,
        isValidate: operationUpdate.isValidate,
      );

      await editOperation(updatedOperation);

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Opération modifiée.')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Une erreur est survenue lors de la modification de l\'opération.',
            ),
          ),
        );
      }
    }
  }
}
