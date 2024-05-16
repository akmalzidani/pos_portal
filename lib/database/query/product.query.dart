import 'package:pos_portal/configs/db.config.dart';
import 'package:pos_portal/models/product.dart';

class ProductQuery {
  final DBConfig _dbConfig = DBConfig.instance;

  Future<List<Product>> selectAll() async {
    final db = await _dbConfig.database;
    final List<Map<String, dynamic>> result = await db.query('Product');
    return result.map((row) => Product.fromMap(row)).toList();
  }

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await _dbConfig.database;
    return await db.insert('Product', data);
  }

  Future<int> update(Map<String, dynamic> data, String where, List<dynamic> whereArgs) async {
    final db = await _dbConfig.database;
    return await db.update('Product', data, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(int id) async {
    final db = await _dbConfig.database;
    return await db.delete('Product', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> selectWhere(String where, List<dynamic> whereArgs) async {
    final db = await _dbConfig.database;
    return await db.query('Product', where: where, whereArgs: whereArgs);
  }

  Future<Map<String, dynamic>> selectBy(String column, dynamic value) async {
    final db = await _dbConfig.database;
    final List<Map<String, dynamic>> result = await db.query('Product', where: '$column = ?', whereArgs: [value]);
    return result.first;
  }
}