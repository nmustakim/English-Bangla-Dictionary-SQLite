import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/dictionary_repository.dart';
import '../datasources/local/database_helper.dart';
import '../models/word_model.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DatabaseHelper databaseHelper;

  DictionaryRepositoryImpl(this.databaseHelper);

  @override
  Future<List<WordEntity>> getWords() async {
    return await databaseHelper.getWords();
  }

  @override
  Future<List<WordEntity>> getFavorites() async {
    return await databaseHelper.getFavorites();
  }

  @override
  Future<void> updateFavorite(WordEntity word) async {
    final wordModel = WordModel.fromEntity(word);
    await databaseHelper.updateWord(wordModel);
  }

  @override
  Future<List<WordEntity>> searchWords(String query) async {
    if (query.isEmpty) {
      return await getWords();
    }
    return await databaseHelper.searchWords(query);
  }

  @override
  Future<List<WordEntity>> searchFavorites(String query) async {
    if (query.isEmpty) {
      return await getFavorites();
    }
    return await databaseHelper.searchFavorites(query);
  }
}