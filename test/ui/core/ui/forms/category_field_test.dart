import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/categories/view_models/category_viewmodel.dart';
import 'package:econoris_app/ui/core/ui/forms/category_field.dart';
import 'package:econoris_app/ui/operations/view_models/operation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../category_test_catalog.dart';

/// Gives the test categories without calling the API.
class _TestCategoryViewModel extends CategoryViewModel {
  @override
  Future<CategoryCatalog> build() async => buildTestCategoryCatalog();
}

/// Gives no operation, so that the picker suggests nothing.
class _TestOperationViewModel extends OperationViewModel {
  @override
  Future<List<Operation>> build() async => const [];
}

void main() {
  /// Shows a form with the category field, which keeps the chosen category like the form view models.
  Future<GlobalKey<FormState>> pumpCategoryForm(WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    int? selectedCategoryId;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          categoryViewModelProvider.overrideWith(_TestCategoryViewModel.new),
          operationViewModelProvider.overrideWith(_TestOperationViewModel.new),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => Form(
                key: formKey,
                child: CategoryField(
                  selectedCategoryId: selectedCategoryId,
                  isExpense: true,
                  onCategorySelected: (categoryId) =>
                      setState(() => selectedCategoryId = categoryId),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    return formKey;
  }

  testWidgets('requires a category', (tester) async {
    final formKey = await pumpCategoryForm(tester);

    expect(formKey.currentState!.validate(), isFalse);
    await tester.pump();

    expect(find.text('La catégorie est obligatoire'), findsOneWidget);
  });

  testWidgets(
    'shows the chosen category with its main category, and clears the error',
    (tester) async {
      final formKey = await pumpCategoryForm(tester);
      formKey.currentState!.validate();
      await tester.pump();

      await tester.tap(find.text('Catégorie'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'loyer');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Loyer'));
      await tester.pumpAndSettle();

      expect(find.text('Logement › Loyer'), findsOneWidget);
      expect(find.text('La catégorie est obligatoire'), findsNothing);
      expect(formKey.currentState!.validate(), isTrue);
    },
  );
}
