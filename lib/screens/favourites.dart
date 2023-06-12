import 'package:e2b_dictionary/controller/dictionary_controller.dart';
import 'package:e2b_dictionary/screens/word_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/settings_controller.dart';
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
      final DictionaryController dictionaryController = Get.find();
      await dictionaryController.getWords();
      await dictionaryController.getFavorites();
      dictionaryController.runFavWordFilter("");
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  final SettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final DictionaryController dictionaryController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
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
                      height: 32,
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (v) =>
                            dictionaryController.runFavWordFilter(v),
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
                  IconButton(
                      onPressed: () => dictionaryController
                          .runFavWordFilter(searchController.text),
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 1.1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Obx(() => ListView.builder(
                  itemCount: dictionaryController.foundFavWords.length,
                  itemBuilder: (context, index) {
                    DictionaryModel newWord =
                        dictionaryController.foundFavWords[index];
                    return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        elevation: 5,
                        shape: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(24)),
                        child: SizedBox(
                          height: 80,
                          child: ListTile(
                            onTap: () {
                              Get.to(() => WordDetails(
                                    dictionaryModel: newWord,
                                  ));
                            },
                            title: Text(
                              newWord.word,

                            ),
                            subtitle: Text(
                              newWord.meaning,
                            ),
                          ),
                        ));
                  })),
            )
          ],
        ),
      ),
    );
  }
}
