import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:socialtec/models/event_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseEvents {
  
  static final nameDB = 'EVENTS';
  static final versionDB = 2;

  static Database? _database;
  Future<Database> get database async {
    if( _database != null ) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async{
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path,nameDB);
    return await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async{
    String query = '''CREATE TABLE tblEvents (
      idEvent INTEGER PRIMARY KEY,
      dscEvent VARCHAR(200),
      dateEvent DATE,
      comp INTEGER
    )''';
    db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String,dynamic> data) async{
    var conexion = await database;
    return conexion.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName,Map<String,dynamic> data) async{
    var conexion = await database;
    return conexion.update(tblName,data,
    where: 'idEvent = ?',
    whereArgs:[data['idEvent']]);
  }

  Future<int> DELETE(String tblName, int idEvent) async {
    var conexion = await database;
    return conexion.delete(tblName,
      where: 'idEvent = ?',
      whereArgs: [idEvent]);
  }

  Future<List<EventModel>> GETALLEVENTS() async {
    var conexion = await database;
    var result = await conexion.query('tblEvents');
    return result.map((event) => EventModel.fromMap(event)).toList();
  }

}