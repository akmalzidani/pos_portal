import 'package:flutter_test/flutter_test.dart';
import 'package:pos_portal/controller/product.controller.dart';
import 'package:pos_portal/models/product.dart';

void main() {
  group('ProductController Tests', () {
    test('selectAll returns empty list initially', () async {
      final ProductController productController = ProductController();
      final List<Product> products = await productController.selectAll();
      expect(products.length, 0);
    });

  });
}
