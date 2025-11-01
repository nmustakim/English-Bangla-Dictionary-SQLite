import 'package:get/get.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/get_word_usecase.dart';
import '../../domain/usecases/search_word_usecase.dart';


class HomeViewModel extends GetxController {
  final GetWordsUseCase getWordsUseCase;
  final SearchWordsUseCase searchWordsUseCase;

  HomeViewModel({
    required this.getWordsUseCase,
    required this.searchWordsUseCase,
  });

  final RxList<WordEntity> words = <WordEntity>[].obs;
  final RxList<WordEntity> filteredWords = <WordEntity>[].obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadWords();
  }

  Future<void> loadWords() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await getWordsUseCase();
      words.value = result;
      filteredWords.value = result;
    } catch (e) {
      errorMessage.value = 'Failed to load words: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchWords(String query) async {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredWords.value = words;
      return;
    }

    try {
      final result = await searchWordsUseCase(query);
      filteredWords.value = result;
    } catch (e) {
      errorMessage.value = 'Search failed: ${e.toString()}';
    }
  }

  void clearSearch() {
    searchQuery.value = '';
    filteredWords.value = words;
  }
}