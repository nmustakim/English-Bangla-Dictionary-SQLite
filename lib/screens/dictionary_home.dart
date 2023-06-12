import 'package:e2b_dictionary/screens/word_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/dictionary_controller.dart';
import '../controller/settings_controller.dart';
import '../models/dictionary_model.dart';

class DictionaryHome extends StatefulWidget {
  const DictionaryHome({Key? key}) : super(key: key);

  @override
  State<DictionaryHome> createState() => _DictionaryHomeState();
}

class _DictionaryHomeState extends State<DictionaryHome> {
  final searchController = TextEditingController();

  int? selectedId;

  @override
  void initState() {
    fetchWordsList();

    super.initState();
  }

  void fetchWordsList() async {
    try {
      final DictionaryController dictionaryController = Get.find();
      await dictionaryController.getWords();
      dictionaryController.runWordFilter("");
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
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          'E2B Dictionary',
          style: TextStyle(
              fontSize: controller.titleFontSize.toDouble(),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
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
                      onChanged: (v) => dictionaryController.runWordFilter(v),
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
                        .runWordFilter(searchController.text),
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
          Column(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    padding: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: dictionaryController.foundWords.length,
                          itemBuilder: (context, index) {
                            DictionaryModel newWord =
                                dictionaryController.foundWords[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              elevation: 5,
                              shape: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(24)),
                              child: SizedBox(
                                height: 80,
                                child: ListTile(
                                  onTap: () {
                                    print(newWord.isFavorite);
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
                              ),
                            );
                          }),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
