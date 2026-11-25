import 'dart:math';

/// Accented letters, with the letters that replace them in a search that ignores accents.
const Map<String, String> _lettersWithoutAccent = {
  'à': 'a',
  'â': 'a',
  'ä': 'a',
  'á': 'a',
  'ã': 'a',
  'ç': 'c',
  'é': 'e',
  'è': 'e',
  'ê': 'e',
  'ë': 'e',
  'î': 'i',
  'ï': 'i',
  'í': 'i',
  'ô': 'o',
  'ö': 'o',
  'ó': 'o',
  'õ': 'o',
  'ù': 'u',
  'û': 'u',
  'ü': 'u',
  'ú': 'u',
  'ÿ': 'y',
  'ñ': 'n',
  'œ': 'oe',
  'æ': 'ae',
};

/// Everything that separates two words: spaces, apostrophes, hyphens, punctuation...
final RegExp _wordSeparators = RegExp(r'[^a-z0-9]+');

/// Normalizes a text for a search that ignores the case and the accents.
/// The words are separated by single spaces: "Taxe d'Habitation" becomes "taxe d habitation".
String normalizeForSearch(String text) {
  final textWithoutAccent = StringBuffer();
  for (final character in text.toLowerCase().split('')) {
    textWithoutAccent.write(_lettersWithoutAccent[character] ?? character);
  }

  return textWithoutAccent.toString().replaceAll(_wordSeparators, ' ').trim();
}

/// How many typos a query word may contain: none in a short word, where one typo already makes another word.
int allowedTypoCountOf(String queryWord) {
  if (queryWord.length < 4) {
    return 0;
  }

  if (queryWord.length < 8) {
    return 1;
  }

  return 2;
}

/// The Damerau-Levenshtein distance (optimal string alignment) between a query word and the closest beginning of a word:
/// the fewest inserted, deleted, replaced or swapped letters that turn the query word into a beginning of the word.
/// "esence" is 1 typo away from "essence", "lyoer" 1 typo away from "loyer", "carbu" 0 typo away from "carburant".
int prefixEditDistance(String queryWord, String word) {
  /* distances[i][j]: distance between the first i letters of the query word and the first j letters of the word */
  final distances = [
    for (var i = 0; i <= queryWord.length; i++)
      List<int>.generate(word.length + 1, (j) => i == 0 ? j : i),
  ];

  for (var i = 1; i <= queryWord.length; i++) {
    for (var j = 1; j <= word.length; j++) {
      distances[i][j] = _editDistanceStep(distances, queryWord, word, i, j);
    }
  }

  /* Any beginning of the word will do: the user may not have typed the whole word yet */
  return distances[queryWord.length].reduce(min);
}

/// The distance between the first i letters of the query word and the first j letters of the word,
/// from the distances of the shorter beginnings.
int _editDistanceStep(
  List<List<int>> distances,
  String queryWord,
  String word,
  int i,
  int j,
) {
  final replacementCost = queryWord[i - 1] == word[j - 1] ? 0 : 1;
  final bestDistance = [
    distances[i - 1][j] + 1,
    distances[i][j - 1] + 1,
    distances[i - 1][j - 1] + replacementCost,
  ].reduce(min);

  final isSwappedPair =
      i > 1 &&
      j > 1 &&
      queryWord[i - 1] == word[j - 2] &&
      queryWord[i - 2] == word[j - 1];
  if (!isSwappedPair) {
    return bestDistance;
  }

  return min(bestDistance, distances[i - 2][j - 2] + 1);
}

/// Splits a text into its normalized words (see [normalizeForSearch]).
List<String> searchWordsOf(String text) {
  final normalizedText = normalizeForSearch(text);
  if (normalizedText.isEmpty) {
    return const [];
  }

  return normalizedText.split(' ');
}
