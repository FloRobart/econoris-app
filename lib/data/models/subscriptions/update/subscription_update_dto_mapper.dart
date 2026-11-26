import 'package:econoris_app/data/models/subscriptions/update/subscription_update_dto.dart';
import 'package:econoris_app/domain/models/subscriptions/update/subscription_update.dart';
import 'package:econoris_app/ui/subscriptions/view_models/subscription_form_viewmodel.dart';

extension SubscriptionUpdateDtoMapper on SubscriptionUpdateDto {
  SubscriptionUpdate toDomain() {
    return SubscriptionUpdate(
      id: id,
      startDate: DateTime.parse(startDate),
      label: label,
      amount: amount,
      categoryId: categoryId,
      source: source,
      destination: destination,
      costs: costs,
      active: active,
      recurrence: recurrenceFromInterval(
        intervalValue: intervalValue,
        intervalUnit: intervalUnit,
      ),
    );
  }
}
