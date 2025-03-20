import 'dart:io';

import 'package:auth_app/data/database/tables/app_info_table.dart';
import 'package:auth_app/data/database/tables/users_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String databaseName = 'auth_database.db';
  int databaseVersion = 2;

  Database? _database;

  DatabaseHelper() {
    init();
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  init() async {
    _database = await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    Directory documents = await getApplicationDocumentsDirectory();
    String path = join(documents.path, databaseName);

    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database database, int version) async {
    await AppInfoTable.createAppInfoTable(database);
    await UsersTable.createUsersTable(database);
  }
}
