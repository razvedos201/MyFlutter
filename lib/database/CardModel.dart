class EnglishCard {
  late int id;
  late String  englishLang;
  late String russianLang;
  late String imageUrl;

  EnglishCard(this.id, this.englishLang, this.russianLang, this.imageUrl);

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['englishLang'] = englishLang;
    map['russianLang'] = russianLang;
    map['imageUrl'] = imageUrl;

    return map;
  }

   EnglishCard.fromMap(Map<String, dynamic> map){
    id = map['id'];
    englishLang = map['englishLang'];
    russianLang = map['russianLang'];
    imageUrl = map['imageUrl'];
  }


}