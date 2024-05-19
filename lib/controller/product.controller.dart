import 'package:pos_portal/database/query/product.query.dart';

import 'package:pos_portal/types/list_product.type.dart';

import '../models/Product.dart';
class ProductController {
  final ProductQuery _productQuery = ProductQuery();

  Future<List<Product>> selectAll() async {
    return await _productQuery.selectAll();
  }

  Future<bool> insert(Product product) async {
    final Map<String, dynamic> data = product.toMap();
    return await _productQuery.insert(data);
  }

  Future<bool> insertOrUpadte(int? id, Product product) async {
    final Map<String, dynamic> data = product.toMap();
    if (id == null) {
      return await insert(product);
    } else {
      return await update(product);
    }
  }
  Future<List<Product>> selectWithType(ProductType type) async {
    List<Product> products = await _productQuery.selectWithType(type);
    return products;
  }

  Future<bool> update(Product product) async {
    final Map<String, dynamic> data = product.toMap();
    return await _productQuery.update(data, 'id = ?', [product.id]);
  }

  Future<bool> delete(int id) async {
    return await _productQuery.delete(id) != 0;
  }

  Future<Product> selectById(String column, dynamic value) async {
    final Map<String, dynamic> result = await _productQuery.selectBy(column, value);
    return Product.fromMap(result);
  }


  Future<List<int>> getInfoProduct() async {
    final int totalProduct = await _productQuery.sumStock();
    final int totalAlmostOutOfStock = await _productQuery.getAlmostOutOfStock();
    final int totalTrx = await _productQuery.getTotalTrx();
    return [totalAlmostOutOfStock, totalProduct,  totalTrx];
  }

}