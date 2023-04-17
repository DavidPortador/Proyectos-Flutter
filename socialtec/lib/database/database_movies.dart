import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:socialtec/models/movie_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseMovies {
  static final nameDB = 'MOVIES';
  static final versionDB = 3;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''CREATE TABLE tblMovies (
      idMovie INTEGER PRIMARY KEY
    )''';
    db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.insert(tblName, data);
  }

  Future<int> DELETE(String tblName, int idMovie) async {
    var conexion = await database;
    return conexion.delete(tblName, where: 'idMovie = ?', whereArgs: [idMovie]);
  }

  Future<List<MovieModel>> GETALLMOVIES() async {
    var conexion = await database;
    var result = await conexion.query('tblMovies');
    return result.map((event) => MovieModel.fromMap(event)).toList();
  }

  Future<bool> valiMovie(int idMovie) async {
    var conexion = await database;
    var result = await conexion
        .query('tblMovies', where: 'idMovie = ?', whereArgs: [idMovie]);
    var data = result.map((event) => MovieModel.fromMap(event)).toList();
    if (data.length > 0) {
      print("--> ${data[0].idMovie}");
      return true;
    } else {
      print("No favorita");
      return false;
    }
  }
}
