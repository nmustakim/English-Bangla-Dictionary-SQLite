// lib/core/bindings/initial_binding.dart
import 'package:get/get.dart';
import '../../data/repositories/dictionary_repository_impl.dart';
import '../../data/datasources/local/database_helper.dart';
import '../../domain/repositories/dictionary_repository.dart';
import '../../domain/usecases/get_word_usecase.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/search_word_usecase.dart';
import '../../domain/usecases/update_favorite_usecase.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseHelper>(DatabaseHelper(), permanent: true);

    Get.put<DictionaryRepository>(
      DictionaryRepositoryImpl(Get.find()),
      permanent: true,
    );

    Get.lazyPut(() => GetWordsUseCase(Get.find()));
    Get.lazyPut(() => GetFavoritesUseCase(Get.find()));
    Get.lazyPut(() => UpdateFavoriteUseCase(Get.find()));
    Get.lazyPut(() => SearchWordsUseCase(Get.find()));
  }
}

