import 'package:e2b_dictionary/controller/favorite_controller.dart';
import 'package:e2b_dictionary/screens/word_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/settings_controller.dart';
import '../database_helper/database_helper.dart';
import '../models/dictionary_model.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final searchController = TextEditingController();

  int? selectedId;

  @override
  void initState() {

      fetchFavoritesList();


    super.initState();
  }

  void fetchFavoritesList() async {
    try {
      final FavoriteController favoriteController = Get.find();
      await favoriteController.getWords();
      await favoriteController.getFavorites();

    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  // void runFilter(String enteredString) {
  //   if (enteredString.isEmpty) {
  //     setState(() {
  //
  //     });
  //   } else {
  //     setState(() {
  //
  //           .where((element) => element.word
  //           .toLowerCase()
  //           .contains(enteredString.toLowerCase()))
  //           .toList();
  //     });
  //   }
  // }
  final SettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();
    return Scaffold(
      appBar: AppBar(backgroundColor:kPrimaryColor,elevation:0 ,centerTitle: true,title: const Text('Favorites',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      extendBody: true,

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 150,
              color: kPrimaryColor,

              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      height: 41,
                      child: TextField(
                        textAlign: TextAlign.center,
                        // onChanged: (v) => runFilter(v),
                        controller: searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  // IconButton(
                  //     // onPressed: () => runFilter(searchController.text),
                  //     icon: const Icon(
                  //       Icons.search,
                  //       color: Colors.white,
                  //       size: 35,
                  //     )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height/1.1,
              decoration: const BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
              child:Obx(() =>  ListView.builder(
                  itemCount: favoriteController.favorites.length,
                  itemBuilder: (context, index) {
                    DictionaryModel newWord = favoriteController.favorites[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      elevation: 5,
                      shape: OutlineInputBorder(
                          borderSide: const BorderSide(color:kPrimaryColor),
                          borderRadius: BorderRadius.circular(24)),
                      child: SizedBox(
                    height: 80,
                    child: ListTile(
                    onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => WordDetails(
                    id: newWord.id!,
                    favorite: newWord.isFavorite ?? 1,
                    word: newWord.word,
                    meaning: newWord.meaning,
                    partsOfSpeech: newWord.partsOfSpeech,
                    example: newWord.example,
                    )));
                    },
                    title: Text(newWord.word),
                    subtitle: Text(newWord.meaning,),
                    ),
                      )
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
