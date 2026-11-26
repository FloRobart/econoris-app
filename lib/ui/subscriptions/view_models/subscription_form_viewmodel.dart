import 'dart:async';

import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/domain/models/subscriptions/create/subscription_create.dart';
import 'package:econoris_app/domain/models/subscriptions/subscription.dart';
import 'package:econoris_app/domain/models/subscriptions/update/subscription_update.dart';
import 'package:econoris_app/ui/core/ui/forms/amount_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

(String, String) _normalizeRecurrence(String recurrence) {
  return switch (recurrence) {
    'mensuel' => ('mensuel', 'mensuel'),
    'trimestriel' => ('trimestriel', 'trimestriel'),
    'semestriel' => ('semestriel', 'semestriel'),
    'annuel' => ('annuel', 'annuel'),
    _ => ('mensuel', 'mensuel'),
  };
}

/// Convertit une récurrence lisible vers les valeurs API interval_value/unit.
(int, String) intervalFromRecurrence(String recurrence) {
  return switch (_normalizeRecurrence(recurrence).$1) {
    'mensuel' => (1, 'months'),
    'trimestriel' => (3, 'months'),
    'semestriel' => (6, 'months'),
    'annuel' => (12, 'months'),
    _ => (1, 'months'),
  };
}

/// Convertit les valeurs interval_value/unit API vers la récurrence lisible.
String recurrenceFromInterval({
  required int intervalValue,
  required String intervalUnit,
}) {
  final unit = intervalUnit.toLowerCase();

  if ((unit == 'years' || unit == 'year') && intervalValue == 1) {
    return 'annuel';
  }
  if (unit != 'months' && unit != 'month') {
    return 'mensuel';
  }

  return switch (intervalValue) {
    1 => 'mensuel',
    3 => 'trimestriel',
    6 => 'semestriel',
    12 => 'annuel',
    _ => 'mensuel',
  };
}

/// ViewModel pour le formulaire de création d'un abonnement.
class SubscriptionFormViewModel extends ChangeNotifier {
  SubscriptionFormViewModel({this.initialSubscription}) {
    final initialAmount = initialSubscription?.amount;

    isExpense = initialAmount == null ? true : initialAmount <= 0;

    amountController = TextEditingController(
      text: initialAmount == null
          ? ''
          : initialAmount.abs().toStringAsFixed(
              initialAmount.truncateToDouble() == initialAmount ? 0 : 2,
            ),
    );

    labelController = TextEditingController(
      text: initialSubscription?.label ?? '',
    );

    selectedDate = initialSubscription?.startDate ?? DateTime.now();

    /* A new subscription has no category until the user chooses one */
    selectedCategoryId = initialSubscription?.categoryId;

    selectedRecurrence = initialSubscription == null
        ? Constantes.subscriptionRecurrences.first
        : recurrenceFromInterval(
            intervalValue: initialSubscription!.intervalValue,
            intervalUnit: initialSubscription!.intervalUnit,
          );

    active = initialSubscription?.active ?? true;

    amountController.addListener(_onDraftValueChanged);
    labelController.addListener(_onDraftValueChanged);
  }

  final Subscription? initialSubscription;
  late final TextEditingController amountController;
  late final TextEditingController labelController;
  late DateTime selectedDate;
  int? selectedCategoryId;
  late String selectedRecurrence;
  late bool isExpense;
  late bool active;

  bool _isRestoringDraft = false;
  bool _isSubmitting = false;
  Timer? _draftSaveDebounceTimer;

  String? _lastSavedAmount;
  String? _lastSavedLabel;
  String? _lastSavedDate;
  int? _lastSavedCategoryId;
  bool? _lastSavedIsExpense;

  bool get isEditing => initialSubscription != null;

  Future<void> restoreDraft() async {
    if (isEditing) {
      return;
    }

    _isRestoringDraft = true;
    final prefs = await SharedPreferences.getInstance();
    final draftAmount = prefs.getString(Constantes.draftSubscriptionAmountKey);
    final draftLabel = prefs.getString(Constantes.draftSubscriptionLabelKey);
    final draftDateRaw = prefs.getString(Constantes.draftSubscriptionDateKey);
    final draftCategoryId = prefs.getInt(
      Constantes.draftSubscriptionCategoryIdKey,
    );
    final draftIsExpense = prefs.getBool(
      Constantes.draftSubscriptionIsExpenseKey,
    );

    _lastSavedAmount = draftAmount;
    _lastSavedLabel = draftLabel;
    _lastSavedDate = draftDateRaw;
    _lastSavedCategoryId = draftCategoryId;
    _lastSavedIsExpense = draftIsExpense;

    final parsedDate = draftDateRaw == null
        ? null
        : DateTime.tryParse(draftDateRaw);

    if (draftAmount != null) {
      amountController.text = draftAmount;
    }
    if (draftLabel != null) {
      labelController.text = draftLabel;
    }
    if (parsedDate != null) {
      selectedDate = parsedDate;
    }
    if (draftCategoryId != null) {
      selectedCategoryId = draftCategoryId;
    }
    if (draftIsExpense != null) {
      isExpense = draftIsExpense;
    }

    _isRestoringDraft = false;
    notifyListeners();
  }

  void updateIsExpense(bool value) {
    isExpense = value;
    notifyListeners();
    unawaited(_saveDraft());
  }

  /// Updates the chosen category, and saves the draft.
  void updateSelectedCategoryId(int value) {
    selectedCategoryId = value;
    notifyListeners();
    unawaited(_saveDraft());
  }

  void updateSelectedDate(DateTime value) {
    selectedDate = value;
    notifyListeners();
    unawaited(_saveDraft());
  }

  void updateSelectedRecurrence(String value) {
    selectedRecurrence = _normalizeRecurrence(value).$2;
    notifyListeners();
  }

  void updateActive(bool value) {
    active = value;
    notifyListeners();
  }

  SubscriptionCreate? buildSubscriptionCreate() {
    final parsedAmount = parseAmountForField(amountController.text);
    final categoryId = selectedCategoryId;
    if (parsedAmount == null || categoryId == null) {
      return null;
    }

    final signedAmount = isExpense ? -parsedAmount.abs() : parsedAmount.abs();

    return SubscriptionCreate(
      startDate: selectedDate,
      label: labelController.text.trim(),
      amount: signedAmount,
      categoryId: categoryId,
      recurrence: selectedRecurrence,
      active: active,
    );
  }

  SubscriptionUpdate? buildSubscriptionEdit() {
    final subscriptionCreate = buildSubscriptionCreate();
    if (subscriptionCreate == null) {
      return null;
    }

    return SubscriptionUpdate(
      id: initialSubscription!.id,
      startDate: subscriptionCreate.startDate,
      label: subscriptionCreate.label,
      amount: subscriptionCreate.amount,
      categoryId: subscriptionCreate.categoryId,
      source: initialSubscription?.source,
      destination: initialSubscription?.destination,
      costs: initialSubscription?.costs ?? 0,
      active: active,
      recurrence: subscriptionCreate.recurrence,
    );
  }

  void onSubmitStarted() {
    _isSubmitting = true;
    unawaited(clearDraft());
  }

  Future<void> clearDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constantes.draftSubscriptionAmountKey);
    await prefs.remove(Constantes.draftSubscriptionLabelKey);
    await prefs.remove(Constantes.draftSubscriptionDateKey);
    await prefs.remove(Constantes.draftSubscriptionCategoryIdKey);
    await prefs.remove(Constantes.draftSubscriptionIsExpenseKey);

    _lastSavedAmount = null;
    _lastSavedLabel = null;
    _lastSavedDate = null;
    _lastSavedCategoryId = null;
    _lastSavedIsExpense = null;
  }

  Future<void> _saveDraft() async {
    if (isEditing || _isRestoringDraft || _isSubmitting) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final draftAmount = amountController.text;
    final draftLabel = labelController.text;
    final draftDate = selectedDate.toIso8601String();
    final draftCategoryId = selectedCategoryId;
    final draftIsExpense = isExpense;

    if (_lastSavedAmount != draftAmount) {
      await prefs.setString(Constantes.draftSubscriptionAmountKey, draftAmount);
      _lastSavedAmount = draftAmount;
    }
    if (_lastSavedLabel != draftLabel) {
      await prefs.setString(Constantes.draftSubscriptionLabelKey, draftLabel);
      _lastSavedLabel = draftLabel;
    }
    if (_lastSavedDate != draftDate) {
      await prefs.setString(Constantes.draftSubscriptionDateKey, draftDate);
      _lastSavedDate = draftDate;
    }
    if (draftCategoryId != null && _lastSavedCategoryId != draftCategoryId) {
      await prefs.setInt(
        Constantes.draftSubscriptionCategoryIdKey,
        draftCategoryId,
      );
      _lastSavedCategoryId = draftCategoryId;
    }
    if (_lastSavedIsExpense != draftIsExpense) {
      await prefs.setBool(
        Constantes.draftSubscriptionIsExpenseKey,
        draftIsExpense,
      );
      _lastSavedIsExpense = draftIsExpense;
    }
  }

  void _onDraftValueChanged() {
    _scheduleDebouncedDraftSave();
  }

  void _scheduleDebouncedDraftSave() {
    if (isEditing || _isRestoringDraft || _isSubmitting) {
      return;
    }

    _draftSaveDebounceTimer?.cancel();
    _draftSaveDebounceTimer = Timer(const Duration(milliseconds: 400), () {
      unawaited(_saveDraft());
    });
  }

  @override
  void dispose() {
    _draftSaveDebounceTimer?.cancel();
    unawaited(_saveDraft());
    amountController.removeListener(_onDraftValueChanged);
    labelController.removeListener(_onDraftValueChanged);
    amountController.dispose();
    labelController.dispose();
    super.dispose();
  }
}
