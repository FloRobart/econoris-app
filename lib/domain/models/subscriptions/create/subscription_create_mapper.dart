import 'package:econoris_app/data/models/subscriptions/create/subscription_create_dto.dart';
import 'package:econoris_app/domain/models/subscriptions/create/subscription_create.dart';
import 'package:econoris_app/ui/subscriptions/view_models/subscription_form_viewmodel.dart';

extension SubscriptionCreateMapper on SubscriptionCreate {
  SubscriptionCreateDto toDto() {
    final interval = intervalFromRecurrence(recurrence);

    return SubscriptionCreateDto(
      startDate: startDate.toIso8601String(),
      label: label,
      amount: amount,
      categoryId: categoryId,
      active: active,
      intervalValue: interval.$1,
      intervalUnit: interval.$2,
      dayOfMonth: startDate.day,
    );
  }
}
