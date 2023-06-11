import 'package:e2b_dictionary/global_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/settings_controller.dart';
import '../database_helper/database_helper.dart';
import '../models/dictionary_model.dart';

class WordDetails extends StatefulWidget {
  final String word;
  final int id;
   int favorite;
 WordDetails(
      {super.key,
      required this.word,
      required this.meaning,
      required this.partsOfSpeech,
      required this.example, required this.id, required this.favorite});

  final String meaning;
  final String partsOfSpeech;
  final String example;

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

  void updateFavoriteStatus() async {
    DictionaryModel dm = DictionaryModel(id:widget.id,
        word:widget.word, meaning: widget.meaning, partsOfSpeech: widget.partsOfSpeech,example: widget.example,isFavorite:widget.favorite);
    await _databaseHelper!.addFavorite(dm);

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,

        title:  Text(
          'Word details',
          style: TextStyle(fontSize: ctrl.titleFontSize.toDouble(), fontWeight: FontWeight.bold),
        ),
        actions: [Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(onTap:(){setState(() {
           widget.favorite == 1 ? widget.favorite = 0 : widget.favorite = 1;
           updateFavoriteStatus();
          });},child:widget.favorite == 1 ? const Icon(Icons.favorite_border_sharp ,size: 40,color: Colors.red,): const Icon(Icons.favorite_sharp,size: 40,color: Colors.red)),
        ),],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: size.width,
              color: kPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.word,
                    style:  TextStyle(
                        fontSize: ctrl.titleFontSize.toDouble(),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
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
                      widget.meaning,
                      style: TextStyle(
                          fontSize: ctrl.bodyFontSize.toDouble(),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Parts of speech: ${widget.partsOfSpeech.toUpperCase()}',
                        style:  TextStyle(
                            fontSize: ctrl.bodyFontSize.toDouble(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Example: ${widget.example}',
                        style:  TextStyle(
                            fontSize: ctrl.bodyFontSize.toDouble(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
