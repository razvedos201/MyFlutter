import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


import 'CardModel.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  
  static late Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'Cards.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE cardsTable(id INTEGER PRIMARY KEY AUTOINCREMENT, english_lang TEXT, russian_lang TEXT, image_url TEXT)'
    );
  }

  //read

  Future<List<EnglishCard>> getCards() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> cardsMapList = await db.query('Cards');
    final List<EnglishCard> cardsList = [];
    cardsMapList.forEach((cardMap) { 
        cardsList.add(EnglishCard.fromMap(cardMap));
    });
    return cardsList;
  }

  Future<EnglishCard> insertCard(EnglishCard card) async {
    Database db= await this.database;
    card.id = await db.insert('cardsTable', card.toMap());

    return card;
  }
}

