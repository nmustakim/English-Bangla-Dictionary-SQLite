import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/dictionary_model.dart';

class DatabaseHelper {
  Database? _database;


  Future<Database> get database async => _database ??= await _initDatabase();
_initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'dictionary.db');
    var exists = await databaseExists(path);

    if(!exists) {

        await Directory(dirname(path)).create(recursive: true);


      ByteData data = await rootBundle.load(join("assets", "dictionary.db"));
      List <int> bytes = data.buffer.asUint8List(
          data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    }
 return _database = await openDatabase(path,version: 1);

    }





  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE Dictionary(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         word TEXT,
  //         meaning TEXT,
  //         partsOfSpeech TEXT,
  //         example TEXT,
  //         isFavorite INTEGER
  //     )
  //     ''');
  // }
  // Database _db;
  //
  // Future<void> init() async {
  //   io.Directory applicationDirectory =
  //   await getApplicationDocumentsDirectory();
  //
  //   String dbPathEnglish =
  //   path.join(applicationDirectory.path, "englishDictionary.db");
  //
  //   bool dbExistsEnglish = await io.File(dbPathEnglish).exists();
  //
  //   if (!dbExistsEnglish) {
  //     // Copy from asset
  //     ByteData data = await rootBundle.load(path.join("assets", "eng_dictionary.db"));
  //     List<int> bytes =
  //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //
  //     // Write and flush the bytes written
  //     await io.File(dbPathEnglish).writeAsBytes(bytes, flush: true);
  //   }
  //
  //   this._db = await openDatabase(dbPathEnglish);
  // }



  Future<int> addFavorite(DictionaryModel dm) async {
    // Get a reference to the database.
    final db = await database;

    return await db.update(
      'Dictionary',
      dm.toMap(),
      where: 'id = ?',
      whereArgs: [dm.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DictionaryModel>> getWords() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Dictionary');


    return List.generate(maps.length, (i) {
      return DictionaryModel(
          id: maps[i]['id'],
          word: maps[i]['word'],
          meaning: maps[i]['meaning'],
          partsOfSpeech: maps[i]['partsOfSpeech'],
          example: maps[i]['example'],
          isFavorite: maps[i]['isFavorite']);

    });
  }



}
