import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/word_model.dart';

class DatabaseHelper {
  static const String _databaseName = 'dictionary.db';
  static const String _tableName = 'Dictionary';
  static const int _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    bool exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(
      path,
      version: _databaseVersion,
    );
  }

  Future<List<WordModel>> getWords() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(_tableName);
      return List.generate(maps.length, (i) => WordModel.fromMap(maps[i]));
    } catch (e) {
      throw Exception('Failed to get words: $e');
    }
  }

  Future<List<WordModel>> getFavorites() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        where: 'isFavorite = ?',
        whereArgs: [0],
      );
      return List.generate(maps.length, (i) => WordModel.fromMap(maps[i]));
    } catch (e) {
      throw Exception('Failed to get favorites: $e');
    }
  }

  Future<int> updateWord(WordModel word) async {
    try {
      final db = await database;
      return await db.update(
        _tableName,
        word.toMap(),
        where: 'id = ?',
        whereArgs: [word.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Failed to update word: $e');
    }
  }

  Future<List<WordModel>> searchWords(String query) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        where: 'LOWER(word) LIKE ?',
        whereArgs: ['%${query.toLowerCase()}%'],
      );
      return List.generate(maps.length, (i) => WordModel.fromMap(maps[i]));
    } catch (e) {
      throw Exception('Failed to search words: $e');
    }
  }

  Future<List<WordModel>> searchFavorites(String query) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        where: 'isFavorite = ? AND LOWER(word) LIKE ?',
        whereArgs: [0, '%${query.toLowerCase()}%'],
      );
      return List.generate(maps.length, (i) => WordModel.fromMap(maps[i]));
    } catch (e) {
      throw Exception('Failed to search favorites: $e');
    }
  }
}
