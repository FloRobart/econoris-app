import 'package:econoris_app/data/models/subscriptions/subscription_dto.dart';
import 'package:econoris_app/domain/models/subscriptions/subscription.dart';

extension SubscriptionMapper on Subscription {
  SubscriptionDto toDto() {
    return SubscriptionDto(
      id: id,
      label: label,
      amount: amount,
      categoryId: categoryId,
      source: source,
      destination: destination,
      costs: costs,
      active: active,
      intervalValue: intervalValue,
      intervalUnit: intervalUnit,
      startDate: startDate.toIso8601String(),
      endDate: endDate?.toIso8601String(),
      dayOfMonth: dayOfMonth,
      lastGeneratedAt: lastGeneratedAt?.toIso8601String(),
      userId: userId,
      createdAt: createdAt.toIso8601String(),
      updatedAt: updatedAt.toIso8601String(),
    );
  }
}
