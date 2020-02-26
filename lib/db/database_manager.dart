import 'package:sqflite/sqflite.dart';

import 'entry_dto.dart';
import '../models/entry.dart';

class DatabaseManager {

  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_CREATE_SCHEMA = 'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);';
  static const String SQL_DROP_TABLE = 'DROP TABLE IF EXISTS journal_entries;';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, description, rating, date) VALUES(?, ?, ?, ?);';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries;';

  static DatabaseManager _instance;

  final Database db;

  DatabaseManager._({Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME,
      version: 1,
      onCreate: (Database db, int version) async {
        createTables(db, SQL_CREATE_SCHEMA);
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveEntry({EntryDTO dto}) {
    db.transaction ( (txn) async {
      await txn.rawInsert(SQL_INSERT,
        [dto.title, dto.description, dto.rating, dto.dateTime.toString()]
      );
    });
  }

  Future<List<Entry>> getEntries() async {
    final entryRecords = await db.rawQuery(SQL_SELECT);
    final entries = entryRecords.map( (record) {
      return Entry(
        title: record['title'],
        description: record['description'],
        rating: record['rating'],
        dateTime: DateTime.parse(record['date']));
    }).toList();
    return entries;
  }

}