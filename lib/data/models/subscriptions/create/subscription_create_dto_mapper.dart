import 'package:econoris_app/data/models/subscriptions/create/subscription_create_dto.dart';
import 'package:econoris_app/domain/models/subscriptions/create/subscription_create.dart';
import 'package:econoris_app/ui/subscriptions/view_models/subscription_form_viewmodel.dart';

extension SubscriptionCreateDtoMapper on SubscriptionCreateDto {
  SubscriptionCreate toDomain() {
    return SubscriptionCreate(
      startDate: DateTime.parse(startDate),
      label: label,
      amount: amount,
      categoryId: categoryId,
      active: active,
      recurrence: recurrenceFromInterval(
        intervalValue: intervalValue,
        intervalUnit: intervalUnit,
      ),
    );
  }
}
