import 'package:pos_portal/database/query/product.query.dart';
import 'package:pos_portal/models/product.dart';

class ProductController {
  final ProductQuery _productQuery = ProductQuery();

  Future<List<Product>> selectAll() async {
    return await _productQuery.selectAll();
  }

  Future<int> insert(Product product) async {
    final Map<String, dynamic> data = product.toMap();
    return await _productQuery.insert(data);
  }

  Future<int> update(Product product) async {
    final Map<String, dynamic> data = product.toMap();
    return await _productQuery.update(data, 'id = ?', [product.id]);
  }

  Future<int> delete(int id) async {
    return await _productQuery.delete(id);
  }

  Future<Product> selectById(String column, dynamic value) async {
    final Map<String, dynamic> result = await _productQuery.selectBy(column, value);
    return Product.fromMap(result);
  }

}