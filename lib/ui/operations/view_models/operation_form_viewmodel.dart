import 'dart:async';

import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/domain/models/operations/update/operation_update.dart';
import 'package:econoris_app/ui/core/ui/forms/amount_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ViewModel pour le formulaire de création d'une opération.
class OperationFormViewModel extends ChangeNotifier {
  /// Initialise le ViewModel avec une opération existante (pour l'édition) ou sans (pour la création), et restaure le brouillon si nécessaire.
  OperationFormViewModel({this.initialOperation}) {
    /// Montant initial de l'opération
    final initialAmount = initialOperation?.amount;

    /// Détermine si l'opération est une dépense ou un revenu
    isExpense = initialAmount == null ? true : initialAmount <= 0;

    /// Initialise les contrôleurs de texte pour le montant
    amountController = TextEditingController(
      text: initialAmount == null
          ? ''
          : initialAmount.abs().toStringAsFixed(
              initialAmount.truncateToDouble() == initialAmount ? 0 : 2,
            ),
    );

    /// Initialise les contrôleurs de texte pour le label
    labelController = TextEditingController(
      text: initialOperation?.label ?? '',
    );

    /// Initialise la date sélectionnée
    selectedDate = initialOperation?.levyDate ?? DateTime.now();

    /* A new operation has no category until the user chooses one */
    selectedCategoryId = initialOperation?.categoryId;

    /// Initialise le statut de validation
    isValidate =
        initialOperation?.isValidate ?? selectedDate.isBefore(DateTime.now());

    /// Ajoute des listeners pour les changements de valeur dans les champs du formulaire, afin de déclencher la sauvegarde du brouillon.
    amountController.addListener(_onDraftValueChanged);
    labelController.addListener(_onDraftValueChanged);
  }

  final Operation? initialOperation;
  late final TextEditingController amountController;
  late final TextEditingController labelController;
  late DateTime selectedDate;
  int? selectedCategoryId;
  late bool isExpense;
  late bool isValidate;

  bool _isRestoringDraft = false;
  bool _isSubmitting = false;
  Timer? _draftSaveDebounceTimer;

  String? _lastSavedAmount;
  String? _lastSavedLabel;
  String? _lastSavedDate;
  int? _lastSavedCategoryId;
  bool? _lastSavedIsExpense;

  bool get isEditing => initialOperation != null;

  /// Restaure les valeurs du brouillon depuis les SharedPreferences.
  Future<void> restoreDraft() async {
    if (isEditing) {
      return;
    }

    _isRestoringDraft = true;
    final prefs = await SharedPreferences.getInstance();
    final draftAmount = prefs.getString(Constantes.draftOperationAmountKey);
    final draftLabel = prefs.getString(Constantes.draftOperationLabelKey);
    final draftDateRaw = prefs.getString(Constantes.draftOperationDateKey);
    final draftCategoryId = prefs.getInt(
      Constantes.draftOperationCategoryIdKey,
    );
    final draftIsExpense = prefs.getBool(Constantes.draftOperationIsExpenseKey);

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

  /// Met à jour le statut de dépense et sauvegarde le brouillon.
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

  /// Met à jour la date sélectionnée et sauvegarde le brouillon.
  void updateSelectedDate(DateTime value) {
    selectedDate = value;
    notifyListeners();
    unawaited(_saveDraft());
  }

  /// Met à jour le statut de validation de l'opération.
  void updateIsValidate(bool value) {
    isValidate = value;
    notifyListeners();
  }

  /// Construit un objet [OperationCreate] à partir des valeurs du formulaire.
  OperationCreate? buildOperationCreate() {
    final parsedAmount = parseAmountForField(amountController.text);
    final categoryId = selectedCategoryId;
    if (parsedAmount == null || categoryId == null) {
      return null;
    }

    final signedAmount = isExpense ? -parsedAmount.abs() : parsedAmount.abs();
    return OperationCreate(
      levyDate: selectedDate,
      label: labelController.text.trim(),
      amount: signedAmount,
      categoryId: categoryId,
      isValidate: selectedDate.isBefore(DateTime.now()),
    );
  }

  /// Construit un objet [OperationUpdate] à partir des valeurs du formulaire, en utilisant les données de l'opération initiale si elles existent.
  OperationUpdate? buildOperationEdit() {
    final operationCreate = buildOperationCreate();
    if (operationCreate == null) {
      return null;
    }

    return OperationUpdate(
      id: initialOperation!.id,
      levyDate: operationCreate.levyDate,
      label: operationCreate.label,
      amount: operationCreate.amount,
      categoryId: operationCreate.categoryId,
      isValidate: isValidate,
      source: initialOperation?.source,
      destination: initialOperation?.destination,
      costs: initialOperation?.costs ?? 0,
    );
  }

  /// Marque le début de la soumission du formulaire, ce qui empêche la sauvegarde du brouillon.
  void onSubmitStarted() {
    _isSubmitting = true;
    unawaited(clearDraft());
  }

  /// Efface les données du brouillon des SharedPreferences.
  Future<void> clearDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constantes.draftOperationAmountKey);
    await prefs.remove(Constantes.draftOperationLabelKey);
    await prefs.remove(Constantes.draftOperationDateKey);
    await prefs.remove(Constantes.draftOperationCategoryIdKey);
    await prefs.remove(Constantes.draftOperationIsExpenseKey);

    _lastSavedAmount = null;
    _lastSavedLabel = null;
    _lastSavedDate = null;
    _lastSavedCategoryId = null;
    _lastSavedIsExpense = null;
  }

  /// Sauvegarde les données du brouillon dans les SharedPreferences, avec une logique de débounce pour éviter les sauvegardes trop fréquentes.
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
      await prefs.setString(Constantes.draftOperationAmountKey, draftAmount);
      _lastSavedAmount = draftAmount;
    }
    if (_lastSavedLabel != draftLabel) {
      await prefs.setString(Constantes.draftOperationLabelKey, draftLabel);
      _lastSavedLabel = draftLabel;
    }
    if (_lastSavedDate != draftDate) {
      await prefs.setString(Constantes.draftOperationDateKey, draftDate);
      _lastSavedDate = draftDate;
    }
    if (draftCategoryId != null && _lastSavedCategoryId != draftCategoryId) {
      await prefs.setInt(Constantes.draftOperationCategoryIdKey, draftCategoryId);
      _lastSavedCategoryId = draftCategoryId;
    }
    if (_lastSavedIsExpense != draftIsExpense) {
      await prefs.setBool(
        Constantes.draftOperationIsExpenseKey,
        draftIsExpense,
      );
      _lastSavedIsExpense = draftIsExpense;
    }
  }

  /// Listener pour les changements de valeur dans les champs du formulaire, qui déclenche la sauvegarde du brouillon.
  void _onDraftValueChanged() {
    _scheduleDebouncedDraftSave();
  }

  /// Planifie une sauvegarde du brouillon avec un délai de débounce pour éviter les sauvegardes trop fréquentes.
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
