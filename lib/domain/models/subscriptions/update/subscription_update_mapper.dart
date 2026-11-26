import 'package:econoris_app/data/models/subscriptions/update/subscription_update_dto.dart';
import 'package:econoris_app/domain/models/subscriptions/update/subscription_update.dart';
import 'package:econoris_app/ui/subscriptions/view_models/subscription_form_viewmodel.dart';

extension SubscriptionUpdateMapper on SubscriptionUpdate {
  SubscriptionUpdateDto toDto() {
    final interval = intervalFromRecurrence(recurrence);

    return SubscriptionUpdateDto(
      id: id,
      startDate: startDate.toIso8601String(),
      label: label,
      amount: amount,
      categoryId: categoryId,
      source: source,
      destination: destination,
      costs: costs,
      active: active,
      intervalValue: interval.$1,
      intervalUnit: interval.$2,
      dayOfMonth: startDate.day,
    );
  }
}
