
import 'package:get/get.dart';
import '../../presentation/viewmodels/settings_view_model.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsViewModel());
  }
}