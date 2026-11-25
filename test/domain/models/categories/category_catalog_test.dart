import 'package:econoris_app/domain/models/categories/category.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../category_test_catalog.dart';

void main() {
  final CategoryCatalog catalog = buildTestCategoryCatalog();

  List<String> labelsOf(List<Category> categories) {
    return categories.map((category) => category.label).toList();
  }

  group('CategoryCatalog lookup', () {
    test('finds a main category and a sub-category by their id', () {
      expect(catalog.findById(housing.id), housing);
      expect(catalog.findById(rent.id), rent);
      expect(catalog.findById(999), isNull);
      expect(catalog.findById(null), isNull);
    });

    test('finds the parent of a sub-category, and none for a main one', () {
      expect(catalog.findParent(rent), housing);
      expect(catalog.findParent(housing), isNull);
    });

    test('knows that a sub-category belongs to the code of its parent', () {
      expect(catalog.belongsToAny(savingsAccounts.id, {'savings'}), isTrue);
      expect(catalog.belongsToAny(savings.id, {'savings'}), isTrue);
      expect(catalog.belongsToAny(rent.id, {'savings', 'income'}), isFalse);
      expect(catalog.belongsToAny(999, {'savings'}), isFalse);
    });

    test('checks the code of a category itself only', () {
      expect(catalog.hasCode(salary.id, 'income_salary'), isTrue);
      expect(catalog.hasCode(income.id, 'income_salary'), isFalse);
    });
  });

  group('CategoryCatalog.search', () {
    test('finds nothing for an empty query', () {
      expect(catalog.search('   '), isEmpty);
    });

    test('ignores the case and the accents', () {
      expect(labelsOf(catalog.search('ELECTRICITE')), ['Électricité']);
      expect(labelsOf(catalog.search('epargne')).first, 'Épargne');
    });

    test('finds a main category first, then its sub-categories', () {
      expect(labelsOf(catalog.search('logement')), [
        'Logement',
        'Loyer',
        'Eau',
        'Électricité',
        'Assurance habitation',
      ]);
    });

    test('matches the beginning of the words only', () {
      expect(labelsOf(catalog.search('eau')), ['Eau']);
    });

    test('finds a category by a keyword that its label does not contain', () {
      expect(labelsOf(catalog.search('essence')), ['Carburant et recharge']);
    });

    test('needs every word of the query, wherever it is', () {
      expect(labelsOf(catalog.search('assurance auto')), [
        'Assurance véhicule',
      ]);
      expect(labelsOf(catalog.search('assurance logement')), [
        'Assurance habitation',
      ]);
    });

    test('puts the labels that start with the query first', () {
      final results = labelsOf(catalog.search('assur'));

      expect(results, ['Assurance habitation', 'Assurance véhicule']);
    });

    test('finds nothing when a word matches no category', () {
      expect(catalog.search('loyer xyz'), isEmpty);
    });
  });

  group('CategoryCatalog.search with typos', () {
    test('finds a category despite a missing, replaced or swapped letter', () {
      expect(labelsOf(catalog.search('esence')), ['Carburant et recharge']);
      expect(labelsOf(catalog.search('carbirant')), ['Carburant et recharge']);
      expect(labelsOf(catalog.search('lyoer')), ['Loyer']);
    });

    test('tolerates typos in every word of the query', () {
      expect(labelsOf(catalog.search('asurance auto')), ['Assurance véhicule']);
    });

    test('puts the label that starts with the query first', () {
      expect(labelsOf(catalog.search('logment')).first, 'Logement');
    });

    test('tolerates no typo in short words', () {
      expect(catalog.search('eu'), isEmpty);
    });

    test('finds nothing when the query is too far from every category', () {
      expect(catalog.search('xyzt'), isEmpty);
    });
  });
}
