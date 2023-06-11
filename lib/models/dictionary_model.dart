class DictionaryModel {
  int? id;
 final String word;
 final String meaning;
 final String partsOfSpeech;
 final String example;
 int? isFavorite;

  DictionaryModel(
      {required this.word,required this.meaning,required this.partsOfSpeech,required this.example ,this.isFavorite,this.id});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
      'partsOfSpeech' : partsOfSpeech,
      'example': example,
      'isFavorite': isFavorite
    };
  }


}
