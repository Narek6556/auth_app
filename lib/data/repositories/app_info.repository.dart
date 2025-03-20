import 'package:auth_app/data/database/database_helper.dart';
import 'package:auth_app/data/database/tables/app_info_table.dart';
import 'package:auth_app/data/models/app_info/app_info.dart';
import 'package:auth_app/data/service_locator.dart';
import 'package:auth_app/extensions/extension_on_int.dart';
import 'package:auth_app/extensions/extension_on_object.dart';
import 'package:sqflite/sqflite.dart';

class AppInfoRepository {
  final DatabaseHelper _databaseHelper = serviceLocator.get<DatabaseHelper>();

  Future<AppInfo?> getAppInfo() async {
    var database = await _databaseHelper.database;
    List<Map<String, dynamic>> result =
        await database.query(AppInfoTable.table, limit: 1);

    if (result.isNotEmpty) {
      return AppInfo.fromJson(result.first);
    }

    return null;
  }

  Future<bool> updateAppInfo(AppInfo newAppInfo) async {
    var database = await _databaseHelper.database;

    var appInfo = await getAppInfo();

    if (appInfo.isNull) {
      var res = await database.insert(
        AppInfoTable.table,
        newAppInfo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return res.isTrue;
    }

    var result = await database.update(
      AppInfoTable.table,
      newAppInfo.toJson(),
      where: '${AppInfoTable.id} = ?',
      whereArgs: [appInfo!.id],
    );

    return result.isTrue;
  }
}
