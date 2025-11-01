import '../entities/word_entity.dart';
import '../repositories/dictionary_repository.dart';

class UpdateFavoriteUseCase {
  final DictionaryRepository repository;

  UpdateFavoriteUseCase(this.repository);

  Future<void> call(WordEntity word) async {
    await repository.updateFavorite(word);
  }
}