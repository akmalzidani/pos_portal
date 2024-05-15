import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/product/add_product_page.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/topbar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Produk'),
      body: BodyTemplate(
          child: Column(
        children: [
          CardAction(
            isImport: true,
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtonDefault(
        title: 'Tambah Produk',
        actionPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddProductPage())),
      ),
    );
  }
}
