import 'dart:math';

import 'package:econoris_app/domain/models/categories/category.dart';
import 'package:econoris_app/utils/search_text.dart';

/* Ranks of a search result: the lower, the better */
const int _labelStartsWithQueryRank = 0;
const int _ownWordsMatchQueryRank = 1;
const int _parentWordsMatchQueryRank = 2;

/// Every category of the application: finds a category by its id, and searches the categories by text.
class CategoryCatalog {
  CategoryCatalog(List<Category> mainCategories)
    : mainCategories = List.unmodifiable(mainCategories) {
    for (final mainCategory in this.mainCategories) {
      _register(mainCategory, parent: null);
    }
  }

  /// A catalog without any category, used while the categories are not loaded.
  CategoryCatalog.empty() : this(const []);

  /// The main categories, each with its sub-categories, in display order.
  final List<Category> mainCategories;

  /* Insertion order is display order: each category comes right before its sub-categories */
  final Map<int, Category> _categoriesById = {};
  final List<_CategorySearchEntry> _searchEntries = [];

  bool get isEmpty => _categoriesById.isEmpty;

  /// Finds a category by its id.
  Category? findById(int? categoryId) {
    if (categoryId == null) {
      return null;
    }

    return _categoriesById[categoryId];
  }

  /// Finds the parent of a category, or null for a main category.
  Category? findParent(Category category) {
    return findById(category.parentId);
  }

  /// Whether the category, or one of its parents, has one of the given codes.
  /// A sub-category of "Épargne" belongs to the code of "Épargne".
  bool belongsToAny(int categoryId, Set<String> codes) {
    Category? category = findById(categoryId);

    while (category != null) {
      if (codes.contains(category.code)) {
        return true;
      }
      category = findParent(category);
    }

    return false;
  }

  /// Whether the category has the given code.
  bool hasCode(int categoryId, String code) {
    return findById(categoryId)?.code == code;
  }

  /// Searches the categories that match every word of the query, ignoring the case and the accents.
  /// A word matches the beginning of a word of the label, of a search keyword, or of the label of the parent:
  /// "logement" finds "Logement" then all its sub-categories, "essence" finds "Carburant et recharge".
  /// The best results come first: the labels that start with the query, then the other own matches,
  /// then the matches through the parent.
  /// When nothing matches, the search tolerates typos: "esence" still finds "Carburant et recharge".
  List<Category> search(String query) {
    final normalizedQuery = normalizeForSearch(query);
    if (normalizedQuery.isEmpty) {
      return const [];
    }

    final queryWords = normalizedQuery.split(' ');
    final exactMatches = _rankedCategories(
      (searchEntry) => searchEntry.rankFor(normalizedQuery, queryWords),
    );
    if (exactMatches.isNotEmpty) {
      return exactMatches;
    }

    /* Only as a fallback: with typos allowed, a correct query would also bring many unrelated categories */
    return _rankedCategories(
      (searchEntry) => searchEntry.typoRankFor(queryWords),
    );
  }

  /// The categories that get a rank, the best rank first, in display order for a same rank.
  List<Category> _rankedCategories(
    int? Function(_CategorySearchEntry searchEntry) rankOfEntry,
  ) {
    final matches = <({Category category, int rank, int displayOrder})>[];

    for (final (displayOrder, searchEntry) in _searchEntries.indexed) {
      final rank = rankOfEntry(searchEntry);
      if (rank == null) {
        continue;
      }

      matches.add((
        category: searchEntry.category,
        rank: rank,
        displayOrder: displayOrder,
      ));
    }

    /* The display order breaks the ties: List.sort is not stable */
    matches.sort((firstMatch, secondMatch) {
      final rankComparison = firstMatch.rank.compareTo(secondMatch.rank);
      if (rankComparison != 0) {
        return rankComparison;
      }

      return firstMatch.displayOrder.compareTo(secondMatch.displayOrder);
    });

    return matches.map((match) => match.category).toList();
  }

  /// Registers a category and its sub-categories, at any depth.
  void _register(Category category, {required Category? parent}) {
    _categoriesById[category.id] = category;
    _searchEntries.add(
      _CategorySearchEntry(category: category, parent: parent),
    );

    for (final subCategory in category.children) {
      _register(subCategory, parent: category);
    }
  }
}

/// The words of a category that a search compares with the query, normalized once for every search.
class _CategorySearchEntry {
  _CategorySearchEntry({required this.category, required Category? parent})
    : _normalizedLabel = normalizeForSearch(category.label),
      _ownWords = [
        ...searchWordsOf(category.label),
        for (final keyword in category.searchKeywords)
          ...searchWordsOf(keyword),
      ],
      _parentWords = parent == null ? const [] : searchWordsOf(parent.label);

  final Category category;
  final String _normalizedLabel;
  final List<String> _ownWords;
  final List<String> _parentWords;

  /// The rank of this category for a query, or null if it does not match.
  int? rankFor(String normalizedQuery, List<String> queryWords) {
    if (_normalizedLabel.startsWith(normalizedQuery)) {
      return _labelStartsWithQueryRank;
    }

    if (queryWords.every(_matchesOwnWord)) {
      return _ownWordsMatchQueryRank;
    }

    final matchesThroughParent = queryWords.every(
      (queryWord) =>
          _matchesOwnWord(queryWord) || _matchesParentWord(queryWord),
    );
    if (matchesThroughParent) {
      return _parentWordsMatchQueryRank;
    }

    return null;
  }

  /// The rank of this category for a query with typos, or null if it does not match.
  /// The fewer typos the better and, for a same number of typos, the labels that start with the first word
  /// of the query come first, as in the search without typos: "logment" finds "Logement" before "Épargne logement".
  int? typoRankFor(List<String> queryWords) {
    final typoCount = _typoCountFor(queryWords);
    if (typoCount == null) {
      return null;
    }

    final firstQueryWord = queryWords.first;
    final firstLabelWord = _normalizedLabel.split(' ').first;
    final labelStartsWithQuery =
        prefixEditDistance(firstQueryWord, firstLabelWord) <=
        allowedTypoCountOf(firstQueryWord);

    /* Two ranks per typo count: one more typo always ranks lower, whatever the label starts with */
    return typoCount * 2 + (labelStartsWithQuery ? 0 : 1);
  }

  /// The number of typos to fix so that every word of the query starts a word of the category or of its parent,
  /// or null if a word of the query needs more typo fixes than its length allows.
  int? _typoCountFor(List<String> queryWords) {
    var typoCount = 0;

    for (final queryWord in queryWords) {
      final wordTypoCount = [
        queryWord.length,
        for (final word in [..._ownWords, ..._parentWords])
          prefixEditDistance(queryWord, word),
      ].reduce(min);

      if (wordTypoCount > allowedTypoCountOf(queryWord)) {
        return null;
      }
      typoCount += wordTypoCount;
    }

    return typoCount;
  }

  bool _matchesOwnWord(String queryWord) {
    return _ownWords.any((ownWord) => ownWord.startsWith(queryWord));
  }

  bool _matchesParentWord(String queryWord) {
    return _parentWords.any((parentWord) => parentWord.startsWith(queryWord));
  }
}
