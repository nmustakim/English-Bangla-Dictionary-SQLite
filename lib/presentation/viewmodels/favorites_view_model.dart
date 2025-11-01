import 'package:get/get.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/search_word_usecase.dart';

class FavoritesViewModel extends GetxController {
  final GetFavoritesUseCase getFavoritesUseCase;
  final SearchWordsUseCase searchWordsUseCase;

  FavoritesViewModel({
    required this.getFavoritesUseCase,
    required this.searchWordsUseCase,
  });

  final RxList<WordEntity> favorites = <WordEntity>[].obs;
  final RxList<WordEntity> filteredFavorites = <WordEntity>[].obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await getFavoritesUseCase();
      favorites.value = result;
      filteredFavorites.value = result;
    } catch (e) {
      errorMessage.value = 'Failed to load favorites: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchFavorites(String query) async {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredFavorites.value = favorites;
      return;
    }

    try {
      final result = await searchWordsUseCase(query, favoritesOnly: true);
      filteredFavorites.value = result;
    } catch (e) {
      errorMessage.value = 'Search failed: ${e.toString()}';
    }
  }

  void clearSearch() {
    searchQuery.value = '';
    filteredFavorites.value = favorites;
  }
}