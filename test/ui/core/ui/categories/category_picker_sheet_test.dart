import 'package:econoris_app/ui/core/ui/categories/widgets/category_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../category_test_catalog.dart';

void main() {
  /// Opens the picker from a button, like the category field does, and gives back the chosen category id.
  Future<int? Function()> openPicker(
    WidgetTester tester, {
    int? selectedCategoryId,
    List<int> suggestedCategoryIds = const [],
  }) async {
    int? chosenCategoryId;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                chosenCategoryId = await showModalBottomSheet<int>(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => CategoryPickerSheet(
                    catalog: buildTestCategoryCatalog(),
                    selectedCategoryId: selectedCategoryId,
                    suggestedCategoryIds: suggestedCategoryIds,
                  ),
                );
              },
              child: const Text('Ouvrir'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Ouvrir'));
    await tester.pumpAndSettle();

    return () => chosenCategoryId;
  }

  testWidgets('lists the main categories, folded', (tester) async {
    await openPicker(tester);

    expect(find.text('Logement'), findsOneWidget);
    expect(find.text('Transports'), findsOneWidget);
    expect(find.text('Loyer'), findsNothing);
  });

  testWidgets('chooses a sub-category after unfolding its main category', (
    tester,
  ) async {
    final chosenCategoryId = await openPicker(tester);

    await tester.tap(find.text('Logement'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Loyer'));
    await tester.pumpAndSettle();

    expect(chosenCategoryId(), rent.id);
  });

  testWidgets('chooses a main category without going into detail', (
    tester,
  ) async {
    final chosenCategoryId = await openPicker(tester);

    await tester.tap(find.text('Logement'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sans préciser de sous-catégorie'));
    await tester.pumpAndSettle();

    expect(chosenCategoryId(), housing.id);
  });

  testWidgets('lists the matching categories while the user types', (
    tester,
  ) async {
    final chosenCategoryId = await openPicker(tester);

    await tester.enterText(find.byType(TextField), 'essence');
    await tester.pumpAndSettle();

    expect(find.text('Carburant et recharge'), findsOneWidget);
    expect(find.text('Logement'), findsNothing);

    await tester.tap(find.text('Carburant et recharge'));
    await tester.pumpAndSettle();

    expect(chosenCategoryId(), fuel.id);
  });

  testWidgets('chooses the best result when the search is validated', (
    tester,
  ) async {
    final chosenCategoryId = await openPicker(tester);

    await tester.enterText(find.byType(TextField), 'loy');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    expect(chosenCategoryId(), rent.id);
  });

  testWidgets('says so when no category matches', (tester) async {
    await openPicker(tester);

    await tester.enterText(find.byType(TextField), 'xyz');
    await tester.pumpAndSettle();

    expect(
      find.text('Aucune catégorie ne correspond à « xyz ».'),
      findsOneWidget,
    );
  });

  testWidgets('suggests the most used categories first', (tester) async {
    final chosenCategoryId = await openPicker(
      tester,
      suggestedCategoryIds: [fuel.id, 999],
    );

    expect(find.text('Les plus utilisées'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Carburant et recharge'));
    await tester.pumpAndSettle();

    expect(chosenCategoryId(), fuel.id);
  });

  testWidgets('unfolds the main category of the chosen category', (
    tester,
  ) async {
    await openPicker(tester, selectedCategoryId: water.id);

    expect(find.text('Eau'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
