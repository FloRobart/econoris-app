import 'package:econoris_app/ui/core/themes/theme.dart';
import 'package:econoris_app/ui/core/ui/operations/widgets/load_older_operations_button.dart';
import 'package:econoris_app/ui/core/ui/operations/widgets/operation_management_index.dart';
import 'package:econoris_app/ui/core/ui/operations/widgets/operation_monthly_stats.dart';
import 'package:econoris_app/ui/core/ui/operations/widgets/operations_list.dart';
import 'package:econoris_app/ui/operations/view_models/loaded_operations.dart';
import 'package:econoris_app/ui/operations/view_models/operation_action.dart';
import 'package:econoris_app/ui/operations/view_models/operation_body_viewmodel.dart';
import 'package:econoris_app/ui/operations/view_models/operation_viewmodel.dart';
import 'package:econoris_app/ui/operations/widgets/month_change_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Corp de l'écran d'accueil de l'application.
class OperationBody extends ConsumerWidget {
  const OperationBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final AsyncValue<LoadedOperations> asyncOperations = ref.watch(
      operationViewModelProvider,
    );

    OperationAction operationAction = OperationAction(
      ref.read(operationViewModelProvider.notifier).deleteOperation,
      ref.read(operationViewModelProvider.notifier).editOperation,
      context,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Affiche le bandeau permettant changer de mois
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const MonthChangeCard(),
        ),

        const SizedBox(height: 12),

        /// Affiche l'index de gestion d'argent
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const OperationManagementIndex(),
        ),

        const SizedBox(height: 12),

        /// Affiche des statistiques mensuelles sur les opérations
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const OperationMonthlyStats(),
        ),

        const SizedBox(height: 32),

        /// Affiche un titre pour les opérations à venir
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.hourglass_empty_outlined,
                  color: AppTheme.infoColor,
                  size: (theme.textTheme.titleLarge?.fontSize ?? 22) + 2,
                ),
                const SizedBox(width: 8),
                Text(
                  'Opérations à venir',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 22),

        /// Affiche une liste d'opérations à venir
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: asyncOperations.when(
            data: (loadedOperations) {
              OperationBodyViewmodel operationViewmodel =
                  OperationBodyViewmodel(loadedOperations.operations);
              return OperationsList(
                operations: operationViewmodel.upComingOperations,
                operationAction: operationAction,
              );
            },
            error: (error, stackTrace) => const Center(
              child: Text(
                'Error de chargement des opérations, Rechargez la page',
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),

        const SizedBox(height: 32),

        /// Affiche un titre pour les opérations récentes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.history_rounded,
                  color: AppTheme.successColor,
                  size: (theme.textTheme.titleLarge?.fontSize ?? 22) + 2,
                ),
                const SizedBox(width: 8),
                Text(
                  'Opérations récentes',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 22),

        /// Affiche une liste d'opérations récentes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: asyncOperations.when(
            data: (loadedOperations) {
              OperationBodyViewmodel operationViewmodel =
                  OperationBodyViewmodel(loadedOperations.operations);
              return OperationsList(
                operations: operationViewmodel.pastOperations,
                operationAction: operationAction,
              );
            },
            error: (error, stackTrace) => const Center(
              child: Text(
                'Error de chargement des opérations, Rechargez la page',
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),

        /* Only the most recent months are loaded at start: the older ones on demand */
        const LoadOlderOperationsButton(),

        const SizedBox(height: 96),
      ],
    );
  }
}
