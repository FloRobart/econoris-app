import 'dart:async';

import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/forms/amount_field.dart';
import 'package:econoris_app/ui/core/ui/forms/amount_type_switch_field.dart';
import 'package:econoris_app/ui/core/ui/forms/category_field.dart';
import 'package:econoris_app/ui/core/ui/forms/date_field.dart';
import 'package:econoris_app/ui/core/ui/forms/label_field.dart';
import 'package:econoris_app/ui/core/ui/forms/submit_button.dart';
import 'package:econoris_app/ui/operations/view_models/operation_form_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Formulaire de création d'une opération.
class OperationCreateForm extends StatefulWidget {
  const OperationCreateForm({super.key, this.initialOperation});

  final Operation? initialOperation;

  @override
  State<OperationCreateForm> createState() {
    return _OperationCreateFormState();
  }
}

/// State du formulaire de création d'une opération.
class _OperationCreateFormState extends State<OperationCreateForm> {
  final _formKey = GlobalKey<FormState>();
  late final OperationFormViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = OperationFormViewModel(
      initialOperation: widget.initialOperation,
    );

    if (widget.initialOperation == null) {
      unawaited(_viewModel.restoreDraft());
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<DateTime?> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _viewModel.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) {
      return null;
    }

    _viewModel.updateSelectedDate(pickedDate);

    return pickedDate;
  }

  void _submit() {
    if (widget.initialOperation == null) {
      _submitCreate();
    } else {
      _submitEdit();
    }
  }

  void _submitCreate() {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    final operationCreate = _viewModel.buildOperationCreate();
    if (operationCreate == null) {
      return;
    }

    _viewModel.onSubmitStarted();
    GoRouter.of(context).pop(operationCreate);
  }

  void _submitEdit() {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    final operationEdit = _viewModel.buildOperationEdit();
    if (operationEdit == null) {
      return;
    }

    _viewModel.onSubmitStarted();
    GoRouter.of(context).pop(operationEdit);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// Champ de sélection du type de montant (dépense ou revenu)
                    AmountTypeSwitchField(
                      isExpense: _viewModel.isExpense,
                      onChanged: _viewModel.updateIsExpense,
                    ),

                    const SizedBox(height: 16),

                    /// Champ de saisie du montant de l'opération
                    AmountField(controller: _viewModel.amountController),

                    const SizedBox(height: 16),

                    /// Champ de saisie du nom de l'opération
                    LabelField(
                      controller: _viewModel.labelController,
                      hintText: 'Nom de l\'operation',
                    ),

                    const SizedBox(height: 16),

                    /// Champ de sélection de la catégorie de l'opération
                    CategoryField(
                      selectedCategoryId: _viewModel.selectedCategoryId,
                      isExpense: _viewModel.isExpense,
                      onCategorySelected: _viewModel.updateSelectedCategoryId,
                    ),

                    const SizedBox(height: 16),

                    /// Champ de sélection de la date de l'opération
                    DateField(
                      selectedDate: _viewModel.selectedDate,
                      onTap: _pickDate,
                    ),

                    /// Permet de valider une opération
                    if (widget.initialOperation != null) ...[
                      const SizedBox(height: 20),
                      SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        value: _viewModel.isValidate,
                        onChanged: _viewModel.updateIsValidate,
                        title: const Text('Opération prélevée'),
                        subtitle: Text(
                          _viewModel.isValidate
                              ? 'Cette opération est marquée comme prélevée.'
                              : 'Cette opération est marquée en attente.',
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),

                    /// Bouton de soumission du formulaire
                    SubmitButton(onPressed: _submit),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
