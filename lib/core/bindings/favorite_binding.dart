
import 'package:get/get.dart';

import '../../presentation/viewmodels/favorites_view_model.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesViewModel(
      getFavoritesUseCase: Get.find(),
      searchWordsUseCase: Get.find(),
    ));
  }
}

