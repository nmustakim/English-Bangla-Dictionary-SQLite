
import 'package:get/get.dart';
import '../../presentation/screens/main_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/word_detail_screen.dart';
import '../bindings/favorite_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/settings_binding.dart';

class AppRoutes {
  static const String splash = '/';
  static const String main = '/main';
  static const String wordDetail = '/word-detail';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: main,
      page: () => const MainScreen(),
      bindings: [
        HomeBinding(),
        FavoritesBinding(),
        SettingsBinding(),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: wordDetail,
      page: () => const WordDetailScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}