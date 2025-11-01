
import 'package:get/get.dart';
import '../../presentation/viewmodels/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(
      getWordsUseCase: Get.find(),
      searchWordsUseCase: Get.find(),
    ));
  }
}

