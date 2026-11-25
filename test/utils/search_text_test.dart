import 'package:econoris_app/utils/search_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeForSearch', () {
    test('removes the case and the accents', () {
      expect(normalizeForSearch('Électricité'), 'electricite');
      expect(normalizeForSearch('Œuvre Ça'), 'oeuvre ca');
    });

    test('separates the words with single spaces', () {
      expect(normalizeForSearch("  Taxe d'Habitation "), 'taxe d habitation');
      expect(normalizeForSearch('High-tech, télécoms'), 'high tech telecoms');
    });
  });

  group('searchWordsOf', () {
    test('splits a text into its normalized words', () {
      expect(searchWordsOf('Prêt étudiant'), ['pret', 'etudiant']);
    });

    test('returns no word for a blank text', () {
      expect(searchWordsOf('  - '), isEmpty);
    });
  });
}
