import 'package:get/get.dart';

class SettingsController extends GetxController {
  var titleFontSize = 30.obs;
  var bodyFontSize = 16.obs;


  void titleFontIncrement() {
    if (titleFontSize < 35) {
      titleFontSize++;
    }

    update();
  }

  void titleFontDecrement() {
    if (titleFontSize > 20) {
      titleFontSize--;
    }

    update();
  }


  void bodyFontIncrement() {
    if (bodyFontSize < 16) {
      bodyFontSize++;
    }
    update();
  }

  void bodyFontDecrement() {
    if (bodyFontSize > 12) {
      bodyFontSize--;
    }
  }


}

