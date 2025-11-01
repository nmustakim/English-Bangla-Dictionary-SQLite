import '../../domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  WordModel({
    required super.id,
    required super.word,
    required super.meaning,
    required super.partsOfSpeech,
    required super.example,
    required super.isFavorite,
  });

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      id: map['id'] as int,
      word: map['word'] as String? ?? '',
      meaning: map['meaning'] as String? ?? '',
      partsOfSpeech: map['partsOfSpeech'] as String? ?? '',
      example: map['example'] as String? ?? '',
      // Handle NULL values: if NULL or 1, treat as NOT favorite (false)
      // if 0, treat as favorite (true)
      isFavorite: (map['isFavorite'] as int?) == 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
      'partsOfSpeech': partsOfSpeech,
      'example': example,
      'isFavorite': isFavorite ? 0 : 1,
    };
  }

  factory WordModel.fromEntity(WordEntity entity) {
    return WordModel(
      id: entity.id,
      word: entity.word,
      meaning: entity.meaning,
      partsOfSpeech: entity.partsOfSpeech,
      example: entity.example,
      isFavorite: entity.isFavorite,
    );
  }
}