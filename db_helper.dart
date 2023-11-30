import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
class DbTables{
  static const String Tests = "Tests";
  static const String Products = "Products";
}
String _testTbl = 'CREATE TABLE ${DbTables.Tests} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Details TEXT NULL)';
String _productsTbl = 'CREATE TABLE ${DbTables.Products} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Price REAL, Img TEXT NULL, Details TEXT NULL)';

class DbHelper{
  static DbHelper? dbHelper;
  static Database? _database;

  DbHelper._createInstance();
  factory DbHelper() {
    dbHelper ??= DbHelper._createInstance();
    return dbHelper as DbHelper;
  }

  Future<Database> _initializeDatabase() async {
    int dbVersion =1;
    final dbFolder = await getExternalStorageDirectory();
    final dbPath = p.join(dbFolder!.path, "Database");
    Directory dbFolderDir = await Directory(dbPath).create(recursive: true);

    final file = File(p.join(dbFolderDir.path, 'test.db'));
    var testDb = await openDatabase(
      file.path,
      version: dbVersion,
      onCreate: _createDatabaseV1,
      onDowngrade: onDatabaseDowngradeDelete
    );
    return testDb;
  }

  void _createDatabaseV1(Database db, int version) async {
    try {
      await db.execute(_testTbl);
      await db.execute(_productsTbl);
    }
    catch(e){
      print("CreateExp:- "+ e.toString());
      rethrow;
    }
  }

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database as Database;
  }

  Future<List<Map<String, dynamic>>?> getAll(String tbl,) async{
    try {
      Database db = await database;
      var res = await db.query(tbl);
      return res;
    } on Exception catch (e) {
      print("Exception in getAll: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getById(String tableName, int id, {String pkName = "Id"}) async{
    try {
      Database db = await database;
      var result= await db.query(tableName,where: "$pkName = ?", whereArgs: [id]);
      return result.isNotEmpty ? result.first : null;
    } on Exception catch (e) {
      print("Exception in getById: ${e}");
      return null;
    }

  }

  Future<int> add(String tbl, Map<String, dynamic> obj, )async{
    try {
      Database db = await database;
      var res = await db.insert(tbl, obj, conflictAlgorithm: ConflictAlgorithm.ignore );
      return res;
    } on Exception catch (e) {
      print("EXP in Insert : ${e}");
      return 0;
    }
  }

  Future<int> update(String tbl, Map<String, dynamic> obj, {String pkName = 'Id'})async{
    try {
      Database db = await database;
      var pkValue = obj[pkName];
      if(pkValue != null){
        var res = await db.update(tbl, obj, where: '$pkName = ?', whereArgs: [pkValue], conflictAlgorithm: ConflictAlgorithm.ignore);
        return res;
      }
      return 0;
    } on Exception catch (e) {
      print("EXP in update : ${e}");
      return 0;
    }
  }

  Future<int> delete(String tbl,Object pkValue, {String pkName = 'Id'})async{
    try {
      Database db = await database;
      if(pkValue != null){
        var res = await db.delete(tbl, where: '$pkName = ?', whereArgs: [pkValue]);
        return res;
      }
      return 0;
    } on Exception catch (e) {
      print("EXP in delete : ${e}");
      return 0;
    }
  }
  Future<List<Map<String,dynamic>>> getProducts()async{
    var db = await database;
    var res = db.query(DbTables.Products,where: 'Id=? and Name=? and Price=? and Details=?',whereArgs:[1,"tea",10000,"ddd"]);
    return res;

  }



}