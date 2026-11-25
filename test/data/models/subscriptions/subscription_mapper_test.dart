import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/data/models/subscriptions/subscription_dto.dart';
import 'package:econoris_app/data/models/subscriptions/subscription_dto_mapper.dart';
import 'package:econoris_app/domain/models/subscriptions/subscription_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Raw JSON as returned by the API, with every optional date filled
  final Map<String, dynamic> subscriptionJson = {
    'id': 7,
    'label': 'Abonnement internet',
    'amount': -29.99,
    'category_id': 66,
    'source': 'Compte courant',
    'destination': null,
    'costs': 0.0,
    'active': true,
    'interval_value': 1,
    'interval_unit': 'months',
    'start_date': '2026-01-05T00:00:00.000',
    'end_date': '2027-01-05T00:00:00.000',
    'day_of_month': 5,
    'last_generated_at': '2026-10-05T00:00:00.000',
    'user_id': 42,
    'created_at': '2026-01-01T12:00:00.000',
    'updated_at': '2026-10-05T12:00:00.000',
  };

  group('SubscriptionDtoMapper.toDomain', () {
    test('converts date strings into DateTime objects', () {
      final subscription = SubscriptionDto.fromJson(subscriptionJson)
          .toDomain();

      expect(subscription.startDate, DateTime(2026, 1, 5));
      expect(subscription.endDate, DateTime(2027, 1, 5));
      expect(subscription.lastGeneratedAt, DateTime(2026, 10, 5));
      expect(subscription.isSelected, Constantes.isSubscriptionSelected);
    });

    test('keeps optional dates null when the API does not send them', () {
      final jsonWithoutOptionalDates = {
        ...subscriptionJson,
        'end_date': null,
        'last_generated_at': null,
      };

      final subscription = SubscriptionDto.fromJson(jsonWithoutOptionalDates)
          .toDomain();

      expect(subscription.endDate, isNull);
      expect(subscription.lastGeneratedAt, isNull);
    });
  });

  group('SubscriptionMapper.toDto', () {
    test('round trip DTO -> domain -> DTO keeps the same values', () {
      final originalDto = SubscriptionDto.fromJson(subscriptionJson);

      final roundTripDto = originalDto.toDomain().toDto();

      expect(roundTripDto, originalDto);
    });
  });
}
