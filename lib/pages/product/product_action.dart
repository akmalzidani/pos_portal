import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/pages/product/product_page.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/input_field.dart';
import 'package:pos_portal/widgets/topbar.dart';
import 'package:pos_portal/controller/product.controller.dart';

import '../../main.dart';
import '../../models/Product.dart';

enum JenisStokBarang { tidakterbatas, terbatas }

class ProductAction extends StatefulWidget {
  final int? idProduct;

  const ProductAction({super.key, this.idProduct});

  @override
  State<ProductAction> createState() => _ProductActionState();
}

class _ProductActionState extends State<ProductAction> {
  final ProductController _productController = ProductController();
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();
  TextEditingController stokProdukController = TextEditingController();
  int? hargaProduk = 0;
  int? stokProduk = 0;

  JenisStokBarang? _character = JenisStokBarang.tidakterbatas;

  @override
  void initState() {
    super.initState();
    if (widget.idProduct != null) {
      _loadProduct().then((product) {
        setState(() {
          namaProdukController.text = product.name;
          hargaProdukController.text = product.price.toInt().toString();
          stokProdukController.text = product.stock.toString();
          hargaProduk = product.price.toInt();
          stokProduk = product.stock;
          _character = product.stockType == 0
              ? JenisStokBarang.tidakterbatas
              : JenisStokBarang.terbatas;
        });
      });
    }
  }

  Future<Product> _loadProduct() {
    return _productController.selectById('id', widget.idProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
          context: context,
          title: widget.idProduct == null ? 'Tambah Produk' : 'Edit Produk',
          isCanBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardAction(
                    isImport: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  HeadingSection(title: 'Detail Produk'),
                  InputField(
                    controller: namaProdukController,
                    label: 'Nama Produk',
                    isWajibIsi: true,
                    hintText: 'Masukkan Nama Produk',
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: hargaProdukController,
                    label: 'Harga Produk',
                    isWajibIsi: true,
                    hintText: 'Rp 0',
                    isDuit: true,
                    onNilaiAngkaChanged: (value) {
                      setState(() {
                        hargaProduk = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Divider(
                thickness: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingSection(title: 'Stok'),
                  RadioListTile<JenisStokBarang>(
                    dense: true,
                    title: const Text(
                      'Tidak Terbatas',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    value: JenisStokBarang.tidakterbatas,
                    groupValue: _character,
                    onChanged: (JenisStokBarang? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                    contentPadding: const EdgeInsets.all(0),
                    activeColor: MyColors.primary,
                  ),
                  RadioListTile<JenisStokBarang>(
                    dense: true,
                    title: const Text(
                      'Terbatas',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    value: JenisStokBarang.terbatas,
                    groupValue: _character,
                    onChanged: (JenisStokBarang? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                    contentPadding: const EdgeInsets.all(0),
                    activeColor: MyColors.primary,
                  ),
                  if (_character == JenisStokBarang.terbatas)
                    Container(
                      margin: const EdgeInsets.only(left: 54),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: InputField(
                          controller: stokProdukController,
                          hintText: '0',
                          isWajibIsi: true,
                          label: 'Jumlah Stok',
                          inputAngka: true,
                          onNilaiAngkaChanged: (value) {
                            setState(() {
                              stokProduk = value;
                            });
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: FloatingButtonDefault(
          title: 'Simpan',
          heroTag: "addProduct",
          actionPressed: () async {
            if (isFilled) {
              bool result =
                  await _productController.insertOrUpadte(product.id, product);
              if (result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(widget.idProduct == null
                        ? 'Produk berhasil ditambahkan'
                        : 'Produk berhasil diubah'),
                  ),
                );
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: const MainScreen(initialIndex: 1), withNavBar: true);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(widget.idProduct == null
                        ? 'Produk gagal ditambahkan'
                        : 'Produk gagal diubah'),
                  ),
                );
              }
            }
          },
          isFilled: true,
          isDisabled: !isFilled,
        ),
      ),
    );
  }

  bool get isFilled =>
      namaProdukController.text.isNotEmpty &&
      hargaProdukController.text.isNotEmpty &&
      (stokProdukController.text.isNotEmpty ||
          _character == JenisStokBarang.tidakterbatas);

  Product get product => Product(
      id: widget.idProduct,
      name: namaProdukController.text,
      price: hargaProduk!.toDouble(),
      stockType: _character == JenisStokBarang.tidakterbatas ? 0 : 1,
      stock: stokProduk!);

  Container HeadingSection({required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600)),
    );
  }
}
