import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/button.dart';
import 'package:pos_portal/pages/product/add_product_page.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/topbar.dart';
import '../../utils/dummy_product.dart';
import '../../widgets/card_list_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(text: "Semua"),
    Tab(text: "Menipis"),
    Tab(text: "Terlaris"),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<DummyProduct> filterProducts(String criteria) {
    switch (criteria) {
      case 'Menipis':
        return listProduct.where((product) => int.parse(product.stock) <= 10).toList();
      case 'Terlaris':
      // Mengurutkan daftar produk berdasarkan jumlah terjualnya
        listProduct.sort((a, b) => int.parse(b.terjual).compareTo(int.parse(a.terjual)));
        return listProduct;
      case 'Semua':
      default:
        return listProduct;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Produk',
      ),
      body: BodyTemplate(
        child: Column(
          children: [
            CardAction(isImport: true),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    tabs: tabs,
                    indicatorColor: MyColors.primary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildTabContent('Semua'),  // Content for "Semua" tab
                  buildTabContent('Menipis'), // Content for "Menipis" tab
                  buildTabContentTerlaris('Terlaris'), // Content for "Terlaris" tab
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonDefault(
        title: 'Tambah Produk', onPressed: () {},
      ),
    );
  }

  Widget buildTabContent(String criteria) {
    List<DummyProduct> products = filterProducts(criteria);
    return SingleChildScrollView(
      child: Column(
        children: [
          ... products.map((product) => CardProduct(product: product)).toList(),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget buildTabContentTerlaris(String criteria) {
    List<DummyProduct> products = filterProducts(criteria);
    return SingleChildScrollView(
      child: Column(
        children: [
          ... products.map((product) => CardProductTerlaris(product: product)).toList(),
          SizedBox(
            height: 100,
          )
        ],
      )
    );
  }
}
