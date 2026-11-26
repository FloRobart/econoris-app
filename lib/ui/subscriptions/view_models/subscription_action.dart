import 'package:econoris_app/domain/models/subscriptions/subscription.dart';
import 'package:econoris_app/domain/models/subscriptions/update/subscription_update.dart';
import 'package:econoris_app/ui/subscriptions/view_models/subscription_form_viewmodel.dart';
import 'package:econoris_app/ui/subscriptions/widgets/subscription_details.dart';
import 'package:econoris_app/ui/subscriptions/widgets/subscription_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionAction {
  SubscriptionAction(
    this.deleteSubscription,
    this.editSubscription,
    this.context,
  );

  final Future<void> Function(int id) deleteSubscription;
  final Future<void> Function(Subscription subscription) editSubscription;
  final BuildContext context;

  /// Affiche les détails d'une subscription dans une bottom sheet.
  Future<void> showDetails(Subscription subscription) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => SubscriptionDetails(
        subscription: subscription,
        onDeleteSubscription: (id) => onDeleteSubscription(id, 1),
        onEditSubscription: onEditSubscription,
      ),
    );
  }

  /// Affiche une boîte de dialogue de confirmation avant de supprimer une subscription.
  Future<void> onDeleteSubscription(int id, int layerNumber) async {
    try {
      final bool? shouldDelete = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          ThemeData theme = Theme.of(dialogContext);

          return AlertDialog(
            title: const Text('Confirmer la suppression'),
            content: const Text(
              'Cette abonnement sera supprimée définitivement.',
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

      await deleteSubscription(id);

      if (context.mounted) {
        for (int i = 0; i < layerNumber; i++) {
          GoRouter.of(context).pop();
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Abonnement supprimé.')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Une erreur est survenue lors de la suppression de l\'abonnement.',
            ),
          ),
        );
      }
    }
  }

  Future<void> onEditSubscription(Subscription subscription) async {
    try {
      if (context.mounted) {
        GoRouter.of(context).pop();
      }

      final SubscriptionUpdate? subscriptionUpdate =
          await showModalBottomSheet<SubscriptionUpdate>(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) =>
                SubscriptionCreateForm(initialSubscription: subscription),
          );

      if (subscriptionUpdate == null) {
        return;
      }

      final interval = intervalFromRecurrence(subscriptionUpdate.recurrence);

      final updatedSubscription = subscription.copyWith(
        startDate: subscriptionUpdate.startDate,
        label: subscriptionUpdate.label,
        amount: subscriptionUpdate.amount,
        categoryId: subscriptionUpdate.categoryId,
        source: subscriptionUpdate.source,
        destination: subscriptionUpdate.destination,
        costs: subscriptionUpdate.costs,
        active: subscriptionUpdate.active,
        intervalValue: interval.$1,
        intervalUnit: interval.$2,
        dayOfMonth: subscriptionUpdate.dayOfMonth,
      );

      await editSubscription(updatedSubscription);

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Abonnement modifié.')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Une erreur est survenue lors de la modification de l\'abonnement.',
            ),
          ),
        );
      }
    }
  }
}
