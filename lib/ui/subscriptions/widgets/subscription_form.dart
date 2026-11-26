import 'dart:async';

import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/domain/models/subscriptions/subscription.dart';
import 'package:econoris_app/ui/core/ui/forms/amount_field.dart';
import 'package:econoris_app/ui/core/ui/forms/amount_type_switch_field.dart';
import 'package:econoris_app/ui/core/ui/forms/category_field.dart';
import 'package:econoris_app/ui/core/ui/forms/date_field.dart';
import 'package:econoris_app/ui/core/ui/forms/label_field.dart';
import 'package:econoris_app/ui/core/ui/forms/submit_button.dart';
import 'package:econoris_app/ui/subscriptions/view_models/subscription_form_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionCreateForm extends StatefulWidget {
  const SubscriptionCreateForm({super.key, this.initialSubscription});

  final Subscription? initialSubscription;

  @override
  State<SubscriptionCreateForm> createState() {
    return _SubscriptionCreateFormState();
  }
}

class _SubscriptionCreateFormState extends State<SubscriptionCreateForm> {
  final _formKey = GlobalKey<FormState>();
  late final SubscriptionFormViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = SubscriptionFormViewModel(
      initialSubscription: widget.initialSubscription,
    );

    if (widget.initialSubscription == null) {
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
    if (widget.initialSubscription == null) {
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

    final subscriptionCreate = _viewModel.buildSubscriptionCreate();
    if (subscriptionCreate == null) {
      return;
    }

    _viewModel.onSubmitStarted();
    GoRouter.of(context).pop(subscriptionCreate);
  }

  void _submitEdit() {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    final subscriptionEdit = _viewModel.buildSubscriptionEdit();
    if (subscriptionEdit == null) {
      return;
    }

    _viewModel.onSubmitStarted();
    GoRouter.of(context).pop(subscriptionEdit);
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
                    AmountTypeSwitchField(
                      isExpense: _viewModel.isExpense,
                      onChanged: _viewModel.updateIsExpense,
                    ),

                    const SizedBox(height: 16),

                    AmountField(controller: _viewModel.amountController),

                    const SizedBox(height: 16),

                    LabelField(
                      controller: _viewModel.labelController,
                      hintText: 'Nom de l\'abonnement',
                    ),

                    const SizedBox(height: 16),

                    CategoryField(
                      selectedCategoryId: _viewModel.selectedCategoryId,
                      isExpense: _viewModel.isExpense,
                      onCategorySelected: _viewModel.updateSelectedCategoryId,
                    ),

                    const SizedBox(height: 16),

                    DateField(
                      selectedDate: _viewModel.selectedDate,
                      onTap: _pickDate,
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      initialValue: _viewModel.selectedRecurrence,
                      decoration: const InputDecoration(
                        labelText: 'Récurrence',
                        border: OutlineInputBorder(),
                      ),
                      items: Constantes.subscriptionRecurrences
                          .map(
                            (recurrence) => DropdownMenuItem<String>(
                              value: recurrence,
                              child: Text(recurrence),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        _viewModel.updateSelectedRecurrence(value);
                      },
                    ),

                    if (widget.initialSubscription != null) ...[
                      const SizedBox(height: 20),
                      SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        value: _viewModel.active,
                        onChanged: _viewModel.updateActive,
                        title: const Text('Abonnement actif'),
                        subtitle: Text(
                          _viewModel.active
                              ? 'Cet abonnement est actif.'
                              : 'Cet abonnement est inactif.',
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),

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
