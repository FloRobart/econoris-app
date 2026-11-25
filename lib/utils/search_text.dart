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

/// Splits a text into its normalized words (see [normalizeForSearch]).
List<String> searchWordsOf(String text) {
  final normalizedText = normalizeForSearch(text);
  if (normalizedText.isEmpty) {
    return const [];
  }

  return normalizedText.split(' ');
}
