import 'package:sqflite/sqlite_api.dart';

class UsersTable {
  static String table = 'users';

  static String id = 'id';
  static String username = 'username';
  static String email = 'email';
  static String password = 'password';

  static Future createUsersTable(Database database) async {
    await database.execute(
      '''
      CREATE TABLE $table (
        $id TEXT PRIMARY KEY,
        $username TEXT NOT NULL,
        $email TEXT NOT NULL,
        $password TEXT NOT NULL
      )
    ''',
    );
  }
}