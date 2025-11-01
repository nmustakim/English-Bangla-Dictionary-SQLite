class WordEntity {
  final int id;
  final String word;
  final String meaning;
  final String partsOfSpeech;
  final String example;
  final bool isFavorite;

  WordEntity({
    required this.id,
    required this.word,
    required this.meaning,
    required this.partsOfSpeech,
    required this.example,
    required this.isFavorite,
  });

  WordEntity copyWith({
    int? id,
    String? word,
    String? meaning,
    String? partsOfSpeech,
    String? example,
    bool? isFavorite,
  }) {
    return WordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      meaning: meaning ?? this.meaning,
      partsOfSpeech: partsOfSpeech ?? this.partsOfSpeech,
      example: example ?? this.example,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

