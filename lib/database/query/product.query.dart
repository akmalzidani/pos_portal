import 'package:pos_portal/configs/db.config.dart';
import 'package:pos_portal/types/list_product.type.dart';

import '../../models/Product.dart';

class ProductQuery {
  final DBConfig _dbConfig = DBConfig.instance;

  Future<List<Product>> selectAll() async {
    final db = await _dbConfig.database;
    final List<Map<String, dynamic>> result = await db.query('Product');
    return result.map((row) => Product.fromMap(row)).toList();
  }

  Future<bool> insert(Map<String, dynamic> data) async {
    final db = await _dbConfig.database;
    data['created_time'] = DateTime.now().toIso8601String();
    data['updated_time'] = DateTime.now().toIso8601String();
    return await db.insert('Product', data) != 0;
  }

  Future<bool> update(Map<String, dynamic> data, String where, List<dynamic> whereArgs) async {
    final db = await _dbConfig.database;
    return await db.update('Product', data, where: where, whereArgs: whereArgs) != 0;
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


  Future<List<Product>> selectWithType(ProductType type) async {
    final db = await _dbConfig.database;
    switch(type){
      case ProductType.all:
        final List<Map<String, dynamic>> result = await db.query('Product');
        return result.map((row) => Product.fromMap(row)).toList();
      case ProductType.almostOutOfStock:
        final List<Map<String, dynamic>> result = await db.query('Product', where: 'stock <= 3 AND stock_type = 1');
        return result.map((row) => Product.fromMap(row)).toList();
      case ProductType.bestSeller:
        final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Product ORDER BY stock DESC');
        return result.map((row) => Product.fromMap(row)).toList();
      default:
        final List<Map<String, dynamic>> result = await db.query('Product');
        return result.map((row) => Product.fromMap(row)).toList();
    }
  }

  Future<int> getAlmostOutOfStock() async {
    final db = await _dbConfig.database;
    final List<Map<String, dynamic>> result = await db.query('Product', where: 'stock <= 3 AND stock_type = 1');
    return result.length;
  }

  Future<int> sumStock() async {
    final db = await _dbConfig.database;
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT SUM(stock) as total FROM Product WHERE stock_type = 1');
    return result.first['total'];
  }

  Future<int> getTotalTrx() async{
    final db = await _dbConfig.database;
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT COUNT(*) as total FROM TransactionRecord');
    return result.first['total'];
  }
}