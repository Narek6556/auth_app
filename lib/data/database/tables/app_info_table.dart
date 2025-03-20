import 'package:sqflite/sqlite_api.dart';

class AppInfoTable {
  static String table = 'appInfo';

  static String id = 'id';
  static String isDarkMode = 'is_dark_mode';
  static String isUserLoggedIn = 'is_user_logged_in';

  static Future createAppInfoTable(Database database) async {
    await database.execute(
      '''
      CREATE TABLE $table (
        $id TEXT PRIMARY KEY,
        $isDarkMode INTEGER,
        $isUserLoggedIn INTEGER
      )
    ''',
    );
  }
}
