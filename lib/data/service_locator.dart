import 'package:auth_app/data/database/database_helper.dart';
import 'package:auth_app/ui/stores/auth_store/auth.store.dart';
import 'package:get_it/get_it.dart';

var serviceLocator = GetIt.instance;

void initServiceLocator() {
  serviceLocator.registerSingleton<DatabaseHelper>(DatabaseHelper());
  serviceLocator.registerSingleton<AuthStore>(AuthStore());
}
