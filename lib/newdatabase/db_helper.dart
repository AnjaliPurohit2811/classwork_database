



import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper{
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();

  Database? _database;

  Future<Database?>get database async => await initDatabase() ?? _database;


  Future<Database?>initDatabase()async{
    final path = await getDatabasesPath();
    final dbPath = join(path, 'user.db');

    _database = await openDatabase(dbPath , version: 1, onCreate: (db, version) async {
      String sql = "CREATE TABLE user ( id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT NOT NULL , age INTEGER NOT NULL, photo BLOB)";
     await db.execute(sql);
    },);
  }
 Future<void>insertData(String name, int age, Uint8List photo) async {
    Database? db = await database;
    String sql = "INSERT INTO user (name,age,photo) VALUES (?, ? ,?)";
    List args =[name, age, photo];
    await db!.rawInsert(sql , args);
  }

  Future<List<Map<String,Object?>>>fetchData() async {
    Database? db = await database;
    String sql = "SELECT * FROM user";
    return await db!.rawQuery(sql);
  }
}