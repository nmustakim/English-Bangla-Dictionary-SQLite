import 'package:e2b_dictionary/database_helper/database_helper.dart';
import 'package:e2b_dictionary/models/dictionary_model.dart';
import 'package:get/get.dart';

class DictionaryController extends GetxController {
  var favorites = <DictionaryModel>[].obs;
  var words = <DictionaryModel>[].obs;
  var foundWords = <DictionaryModel>[].obs;
  var foundFavWords = <DictionaryModel>[].obs;

  getWords() async {
    words.value = await DatabaseHelper().getWords();
  }

  getFavorites() async {
    favorites.addAll(words.where((p) => p.isFavorite == 0));
  }

  void runWordFilter(String enteredString) {
    var result = <DictionaryModel>[];
    if (enteredString.isEmpty) {
      result = words;
    } else {
      result = words
          .where((element) =>
              element.word.toLowerCase().contains(enteredString.toLowerCase()))
          .toList();
    }
    foundWords.value = result;
  }

  void runFavWordFilter(String enteredString) {
    var result = <DictionaryModel>[];
    if (enteredString.isEmpty) {
      result = favorites;
    } else {
      result = favorites
          .where((element) =>
              element.word.toLowerCase().contains(enteredString.toLowerCase()))
          .toList();
    }
    foundFavWords.value = result;
  }
}
