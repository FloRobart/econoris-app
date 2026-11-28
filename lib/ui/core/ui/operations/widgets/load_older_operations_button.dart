import 'package:econoris_app/ui/core/themes/theme.dart';
import 'package:econoris_app/ui/core/ui/utils/format_date.dart';
import 'package:econoris_app/ui/operations/view_models/loaded_operations.dart';
import 'package:econoris_app/ui/operations/view_models/operation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Button under the past operations, which loads the page of operations before the loaded ones.
/// It disappears once every operation of the user is loaded.
class LoadOlderOperationsButton extends ConsumerWidget {
  const LoadOlderOperationsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedOperations = ref.watch(operationViewModelProvider).value;
    if (loadedOperations == null || !loadedOperations.hasOlderOperations) {
      return const SizedBox.shrink();
    }

    final isLoading =
        loadedOperations.olderOperationsLoading ==
        OlderOperationsLoading.inProgress;
    final hasFailed =
        loadedOperations.olderOperationsLoading ==
        OlderOperationsLoading.failed;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Column(
        children: [
          if (hasFailed)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Les opérations plus anciennes n\'ont pas pu être chargées.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.errorColor),
              ),
            ),

          OutlinedButton.icon(
            onPressed: isLoading
                ? null
                : ref
                      .read(operationViewModelProvider.notifier)
                      .loadOlderOperations,
            icon: isLoading
                ? const SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.history_rounded),
            label: Text(_buildPreviousPageLabel(loadedOperations)),
          ),
        ],
      ),
    );
  }

  /// Names the months that the button loads, for instance "Charger les opérations de juin 2026 à août 2026".
  String _buildPreviousPageLabel(LoadedOperations loadedOperations) {
    final firstMonth = formatDate(
      loadedOperations.previousPageStartDate,
      customFormat: 'MMMM yyyy',
    );
    final lastMonth = formatDate(
      loadedOperations.previousPageEndDate,
      customFormat: 'MMMM yyyy',
    );

    return 'Charger les opérations de $firstMonth à $lastMonth';
  }
}
