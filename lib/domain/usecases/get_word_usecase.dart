import '../entities/word_entity.dart';
import '../repositories/dictionary_repository.dart';

class GetWordsUseCase {
  final DictionaryRepository repository;

  GetWordsUseCase(this.repository);

  Future<List<WordEntity>> call() async {
    return await repository.getWords();
  }
}




