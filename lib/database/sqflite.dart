import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
// 

class DatabaseSettings {
  static final _databaseName = 'EnglishCard.db';
  static final _databaseVersion = 1;
  static final table  = "card_table";
  static final columnId = "id";
  static final columnEnglish = "englishLang";
  static final columnRussian = "russianLang";
  static final columnUrl = "imageUrl";

  //create Singltone
  DatabaseSettings._privateConstructor();
  static final DatabaseSettings instance = DatabaseSettings._privateConstructor();


  static Database? _database;
  Future<Database?> get database async {
    if(database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  
  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute(

      """
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
        $columnEnglish TEXT NOT NULL,
        $columnRussian TEXT NOT NULL,
        $columnUrl TEXT NOT NULL
      )
      
      """

    );
    
  } 

  Future<int> insert(Map<String,dynamic> row ) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String,dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }



}