import 'package:econoris_app/config/constantes.dart';

/// Days around the theoretical start of a financial month, among which the salary that really starts it
/// is searched (see FinancialDate): one month up to the current day of the month, widened by a safety margin.
///
/// The statistics of the month are computed from the operations of this window onwards:
/// the operations from [start] must be loaded to compute them.
class FinancialMonthSearchWindow {
  /// Window of the financial month [monthOffset] months away from the current one.
  factory FinancialMonthSearchWindow(int monthOffset) {
    final now = DateTime.now();

    return FinancialMonthSearchWindow._(
      start: DateTime(
        now.year,
        now.month + monthOffset - 1,
        now.day,
      ).subtract(_safetyMargin),
      end: DateTime(
        now.year,
        now.month + monthOffset,
        now.day,
      ).add(_safetyMargin),
    );
  }

  const FinancialMonthSearchWindow._({required this.start, required this.end});

  static const Duration _safetyMargin = Duration(
    days: Constantes.salaryWindowSafetyMarginDays,
  );

  final DateTime start;
  final DateTime end;
}
