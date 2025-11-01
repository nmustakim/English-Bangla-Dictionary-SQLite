import '../entities/word_entity.dart';
import '../repositories/dictionary_repository.dart';

class SearchWordsUseCase {
  final DictionaryRepository repository;

  SearchWordsUseCase(this.repository);

  Future<List<WordEntity>> call(String query, {bool favoritesOnly = false}) async {
    if (favoritesOnly) {
      return await repository.searchFavorites(query);
    }
    return await repository.searchWords(query);
  }
}