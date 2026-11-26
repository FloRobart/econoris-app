import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/themes/theme.dart';
import 'package:econoris_app/ui/core/ui/categories/category_display.dart';
import 'package:econoris_app/ui/core/ui/categories/view_models/category_viewmodel.dart';
import 'package:econoris_app/ui/core/ui/utils/format_amount.dart';
import 'package:econoris_app/ui/core/ui/utils/format_date.dart';
import 'package:econoris_app/ui/core/ui/widgets/detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OperationDetails extends ConsumerWidget {
  const OperationDetails({
    super.key,
    required this.operation,
    required this.onDeleteOperation,
    required this.onEditOperation,
  });

  final Operation operation;
  final Future<void> Function(int id) onDeleteOperation;
  final Future<void> Function(Operation operation) onEditOperation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final String operationDate =
        formatDate(operation.levyDate, customFormat: 'dd MMMM yyyy') ?? '-';
    final CategoryCatalog categoryCatalog =
        ref.watch(categoryViewModelProvider).value ?? CategoryCatalog.empty();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  operation.amount < 0
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: operation.amount < 0
                      ? AppTheme.errorColor
                      : AppTheme.successColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Détails de l\'opération',
                  style: theme.textTheme.titleLarge,
                ),
                Spacer(),
                IconButton(
                  onPressed: () => onEditOperation(operation),
                  icon: Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Modifier',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.label,
              label: 'Libellé',
              value: operation.label,
            ),
            DetailRow(
              icon: Icons.calendar_month,
              label: 'Date',
              value: operationDate,
            ),
            DetailRow(
              icon: Icons.attach_money,
              label: 'Montant',
              value: formatAmount(operation.amount),
              fontColor: operation.amount < 0
                  ? AppTheme.errorColor
                  : AppTheme.successColor,
            ),
            DetailRow(
              icon: categoryIconOf(
                categoryCatalog,
                categoryCatalog.findById(operation.categoryId),
              ),
              label: 'Catégorie',
              value: categoryFullLabelOf(categoryCatalog, operation.categoryId),
            ),
            DetailRow(
              icon: Icons.source,
              label: 'Source',
              value: operation.source ?? '-',
            ),
            DetailRow(
              icon: Icons.description,
              label: 'Destination',
              value: operation.destination ?? '-',
            ),
            DetailRow(
              icon: Icons.check_circle_outlined,
              label: 'Statut',
              value: operation.isValidate ? 'Validée' : 'En attente',
              fontColor: operation.isValidate
                  ? AppTheme.successColor
                  : AppTheme.infoColor,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                onPressed: () => onDeleteOperation(operation.id),
                style: FilledButton.styleFrom(
                  backgroundColor: theme.colorScheme.error,
                  foregroundColor: theme.colorScheme.onError,
                ),
                icon: const Icon(Icons.delete_outline),
                label: const Text('Supprimer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
