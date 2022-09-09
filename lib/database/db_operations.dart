import 'package:smart_store/database/db_controller.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperations<Model> {
  final Database database = DbController().database;

  // final int userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name) ?? 0;

  Future<int> create(Model model);

  Future<List<Model>> read();

  Future<Model?> show(int id);

  Future<bool> update(Model model);

  Future<bool> delete(int id);

  Future<void> clear() async {}
}
