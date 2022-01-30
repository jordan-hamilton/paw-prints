import 'package:sqflite/sqflite.dart';

import 'entry_dto.dart';
import '../models/entry.dart';

class DatabaseManager {
  static const String databaseFilename = 'journal.sqlite3.db';
  static const String sqlDropTable = 'DROP TABLE IF EXISTS journal_entries;';
  static const String sqlInsert =
      'INSERT INTO journal_entries(title, description, rating, date) VALUES(?, ?, ?, ?);';
  static const String sqlSelect = 'SELECT * FROM journal_entries;';

  static DatabaseManager? _instance;

  final Database? db;

  DatabaseManager._({Database? database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance!;
  }

  static Future initialize(String schema) async {
    final db = await openDatabase(databaseFilename, version: 1,
        onCreate: (Database db, int version) async {
      createTables(db, schema);
    });
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveEntry({EntryDTO? dto}) {
    db!.transaction((txn) async {
      await txn.rawInsert(sqlInsert,
          [dto!.title, dto.description, dto.rating, dto.dateTime.toString()]);
    });
  }

  Future<List<Entry>> getEntries() async {
    final entryRecords = await db!.rawQuery(sqlSelect);
    final entries = entryRecords.map((record) {
      return Entry(
          title: record['title'] as String?,
          description: record['description'] as String?,
          rating: record['rating'] as int?,
          dateTime: DateTime.parse(record['date'] as String));
    }).toList();
    return entries;
  }
}
