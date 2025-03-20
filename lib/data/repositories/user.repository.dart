import 'package:auth_app/data/database/database_helper.dart';
import 'package:auth_app/data/database/tables/users_table.dart';
import 'package:auth_app/data/models/user/user.dart';
import 'package:auth_app/data/service_locator.dart';
import 'package:auth_app/extensions/extension_on_int.dart';
import 'package:auth_app/extensions/extension_on_object.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  final DatabaseHelper _databaseHelper = serviceLocator.get<DatabaseHelper>();

  Future<bool> createUser(User user) async {
    var database = await _databaseHelper.database;

    var result = await database.insert(
      UsersTable.table,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return result.isTrue;
  }

  Future<List<User>> getUsers() async {
    var database = await _databaseHelper.database;

    var results = await database.query(UsersTable.table);
    if (results.isEmpty || results.isNull) return [];

    List<User> users = [];

    for (int i = 0; i < results.length; i++) {
      var user = User.fromJson(results[i]);
      users.add(user);
    }

    return users;
  }

  Future<bool> updateUser(User newUser) async {
    var database = await _databaseHelper.database;

    var result = await database.update(
      UsersTable.table,
      newUser.toJson(),
      where: '${UsersTable.id} = ?',
      whereArgs: [newUser.id],
    );

    return result.isTrue;
  }

  Future<User?> getUserByUsername(String username) async {
    var database = await _databaseHelper.database;

    var result = await database.query(
      UsersTable.table,
      where: '${UsersTable.username} = ?',
      whereArgs: [username],
    );

    if (result.isNull || result.isEmpty) return null;

    return User.fromJson(result.first);
  }

  Future<User?> getUserByEmail(String email) async {
    var database = await _databaseHelper.database;

    var result = await database.query(
      UsersTable.table,
      where: '${UsersTable.email} = ?',
      whereArgs: [email],
    );

    if (result.isNull || result.isEmpty) return null;

    return User.fromJson(result.first);
  }
}
