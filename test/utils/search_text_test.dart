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

  group('prefixEditDistance', () {
    test('is zero for the beginning of the word', () {
      expect(prefixEditDistance('carbu', 'carburant'), 0);
    });

    test('counts a missing, a replaced or an extra letter as one typo', () {
      expect(prefixEditDistance('esence', 'essence'), 1);
      expect(prefixEditDistance('cinrma', 'cinema'), 1);
      expect(prefixEditDistance('loyyer', 'loyer'), 1);
    });

    test('counts two swapped letters as one typo', () {
      expect(prefixEditDistance('lyoer', 'loyer'), 1);
    });

    test('counts every letter of a word with nothing in common', () {
      expect(prefixEditDistance('xyz', 'loyer'), 3);
    });
  });

  group('allowedTypoCountOf', () {
    test('allows more typos in longer words', () {
      expect(allowedTypoCountOf('eau'), 0);
      expect(allowedTypoCountOf('loyer'), 1);
      expect(allowedTypoCountOf('carbirant'), 2);
    });
  });
}
