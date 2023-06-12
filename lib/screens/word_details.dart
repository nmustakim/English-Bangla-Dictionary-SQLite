import 'package:e2b_dictionary/controller/dictionary_controller.dart';
import 'package:e2b_dictionary/global_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/settings_controller.dart';
import '../database_helper/database_helper.dart';
import '../models/dictionary_model.dart';

class WordDetails extends StatefulWidget {
  final DictionaryModel dictionaryModel;

  const WordDetails({super.key, required this.dictionaryModel});

  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  final SettingsController ctrl = Get.find();
  DatabaseHelper? _databaseHelper;
  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DictionaryController dictionaryController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Word details',
          style: TextStyle(
              fontSize: ctrl.titleFontSize.toDouble(),
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () async {
                int newIsFavorite = widget.dictionaryModel.isFavorite == 1 ||
                        widget.dictionaryModel.isFavorite == null
                    ? 0
                    : 1;
                DictionaryModel updatedModel = DictionaryModel(
                  id: widget.dictionaryModel.id,
                  word: widget.dictionaryModel.word,
                  meaning: widget.dictionaryModel.meaning,
                  partsOfSpeech: widget.dictionaryModel.partsOfSpeech,
                  example: widget.dictionaryModel.example,
                  isFavorite: newIsFavorite,
                );
                await _databaseHelper?.update(updatedModel);
                dictionaryController.favorites.clear();
                await dictionaryController.getWords();
                await dictionaryController.getFavorites();

                setState(() {
                  widget.dictionaryModel.isFavorite = newIsFavorite;
                });
              },
              child: widget.dictionaryModel.isFavorite == 1 || widget.dictionaryModel.isFavorite == null
                  ? const Icon(Icons.favorite_border_sharp,
                      size: 40, color: Colors.red)
                  : const Icon(Icons.favorite_sharp,
                      size: 40, color: Colors.red),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 300,
            width: size.width,
            color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.dictionaryModel.word,
                  style: TextStyle(
                      fontSize: ctrl.titleFontSize.toDouble(),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              margin: const EdgeInsets.only(top: 200),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      widget.dictionaryModel.meaning,
                      style: TextStyle(
                          fontSize: ctrl.bodyFontSize.toDouble(),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                        'Parts of speech: ${widget.dictionaryModel.partsOfSpeech.toUpperCase()}',
                        style: TextStyle(
                            fontSize: ctrl.bodyFontSize.toDouble(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Example: ${widget.dictionaryModel.example}',
                        style: TextStyle(
                            fontSize: ctrl.bodyFontSize.toDouble(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
