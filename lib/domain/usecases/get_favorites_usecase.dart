import '../entities/word_entity.dart';
import '../repositories/dictionary_repository.dart';

class GetFavoritesUseCase {
  final DictionaryRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<WordEntity>> call() async {
    return await repository.getFavorites();
  }
}
