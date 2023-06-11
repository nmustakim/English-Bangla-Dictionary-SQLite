import 'package:e2b_dictionary/database_helper/database_helper.dart';
import 'package:e2b_dictionary/models/dictionary_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController
{
  var favorites = <DictionaryModel> [].obs;
  var words = <DictionaryModel> [].obs;

  addFavorite(DictionaryModel dm)async{
    await DatabaseHelper().addFavorite(dm);
  }
  getWords()async{
    words.value = await DatabaseHelper().getWords();
  }
  getFavorites()async{
    favorites.addAll(words.where((p) =>p.isFavorite ==0 ));
   
  }
  removeFavorite(DictionaryModel dm)async{
    await DatabaseHelper().removeFavorite(dm);
  }













}