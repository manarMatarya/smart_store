import 'package:smart_store/database/db_operations.dart';
import 'package:smart_store/models/cart.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class CartDbController extends DbOperations<Cart> {
  int userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;

  @override
  Future<int> create(Cart model) async {
    return await database.insert(Cart.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await database.delete(
      Cart.tableName,
      where: 'id = ? AND user_id = ?',
      whereArgs: [id, userId],
    );
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Cart>> read() async {
    List<Map<String, dynamic>> rowsMap = await database.rawQuery(
        'SELECT * FROM cart WHERE user_id = ?',[userId]);
    return rowsMap.map((rowMap) => Cart.fromMap(rowMap)).toList();
  }

  @override
  Future<Cart?> show(int id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Cart model) async {
    int countOfUpdatedRows = await database.update(
      Cart.tableName,
      model.toMap(),
      where: 'id = ? AND user_id = ?',
      whereArgs: [model.id, userId],
    );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<bool> clear() async {
    int countOfDeletedRows = await database.delete(
      Cart.tableName,
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return countOfDeletedRows > 0;
  }
}
