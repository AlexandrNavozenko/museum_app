import 'package:museum_app/models/DBInfoTour.dart';
import 'package:museum_app/models/DBModelDefault.dart';
import 'package:museum_app/models/DBTourDetail.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:sqflite/sqflite.dart';

abstract class DBProvider {
  static Database _db;

  static const String DB_NAME = '/museum_07.db';
  static const String SEPARATOR = '';
  static const String WHERE_ID = 'id = ?';

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + DB_NAME;
      print(_path);
      print(schemas.join(SEPARATOR));
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static List<String> schemas = [
    DBTourName.schema,
  ];

  static void onCreate(Database db, int version) async =>
      await db.execute(schemas.join(SEPARATOR));

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, DBModelDefault model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, DBModelDefault model) async =>
      await _db
          .update(table, model.toMap(), where: WHERE_ID, whereArgs: [model.id]);

  static Future<int> delete(String table, DBModelDefault model) async =>
      await _db.delete(table, where: WHERE_ID, whereArgs: [model.id]);
}
