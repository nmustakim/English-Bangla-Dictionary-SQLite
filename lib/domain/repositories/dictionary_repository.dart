

import '../entities/word_entity.dart';

abstract class DictionaryRepository {
  Future<List<WordEntity>> getWords();
  Future<List<WordEntity>> getFavorites();
  Future<void> updateFavorite(WordEntity word);
  Future<List<WordEntity>> searchWords(String query);
  Future<List<WordEntity>> searchFavorites(String query);
}

