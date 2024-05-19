import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/controller/product.controller.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/route/route.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/button.dart';
import 'package:pos_portal/pages/product/product_action.dart';
import 'package:pos_portal/widgets/custom_dialog.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/topbar.dart';
import 'package:pos_portal/widgets/card_product.dart';
import 'package:pos_portal/models/Product.dart';
import 'package:pos_portal/types/list_product.type.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(text: "Semua"),
    Tab(text: "Menipis"),
    Tab(text: "Terlaris"),
  ];
  late TabController _tabController;
  final ProductController _productController = ProductController();
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    loadProducts(ProductType.all);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (!_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          loadProducts(ProductType.all);
          break;
        case 1:
          loadProducts(ProductType.almostOutOfStock);
          break;
        case 2:
          loadProducts(ProductType.bestSeller);
          break;
      }
    }
  }

  void loadProducts(ProductType type) async {
    final products = await _productController.selectWithType(type);
    setState(() {
      _products = products;
    });
  }

  void _showConfirmDeleteDialog(int idProduct) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomConfirmationDialog(
          title: 'Hapus Produk',
          content: 'Apakah Anda yakin ingin menghapus produk ini?',
          onConfirm: () async {
            bool isSucceed = await _productController.delete(idProduct);
            if (isSucceed) {
              _handleTabSelection(); // reload products based on current tab
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Produk berhasil dihapus'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Produk gagal dihapus'),
                ),
              );
            }
            Navigator.of(context).pop();
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
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
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
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
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  buildTabContent(), // Content for "Semua" tab
                  buildTabContent(), // Content for "Menipis" tab
                  buildTabContent(), // Content for "Terlaris" tab
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtonDefault(
        heroTag: "product",
        title: 'Tambah Produk',
        actionPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const ProductAction(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
      ),
    );
  }

  Widget buildTabContent() {
    return SingleChildScrollView(
      child: Column(
        children: _products.map((product) {
          return GestureDetector(
            onLongPress: () {
              _showConfirmDeleteDialog(product.id!);
            },
            child: CardProduct(product: product),
          );
        }).toList(),
      ),
    );
  }
}
