import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/input_field.dart';
import 'package:pos_portal/widgets/topbar.dart';

enum JenisStokBarang { tidakterbatas, terbatas }

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();
  TextEditingController stokProdukController = TextEditingController();
  int? hargaProduk = 0;
  int? stokProduk = 0;

  JenisStokBarang? _character = JenisStokBarang.tidakterbatas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Tambah Produk', isCanBack: true),
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
                  SizedBox(height: 20),
                  HeadingSection(title: 'Detail Produk'),
                  InputField(
                    controller: namaProdukController,
                    label: 'Nama Produk',
                    isWajibIsi: true,
                    hintText: 'Masukkan Nama Produk',
                  ),
                  SizedBox(height: 25),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
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
                    contentPadding: EdgeInsets.all(0),
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
                    contentPadding: EdgeInsets.all(0),
                    activeColor: MyColors.primary,
                  ),
                  if (_character == JenisStokBarang.terbatas)
                    Container(
                      margin: EdgeInsets.only(left: 54),
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
          actionPressed: (namaProdukController.text.isNotEmpty &&
                  hargaProdukController.text.isNotEmpty)
              ? (_character == JenisStokBarang.terbatas &&
                      stokProdukController.text.isNotEmpty)
                  ? () {}
                  : (_character == JenisStokBarang.tidakterbatas)
                      ? () {}
                      : () {}
              : () {},
          isFilled: true,
          isDisabled: (namaProdukController.text.isNotEmpty &&
                  hargaProdukController.text.isNotEmpty)
              ? (_character == JenisStokBarang.terbatas &&
                      stokProdukController.text.isNotEmpty)
                  ? false
                  : (_character == JenisStokBarang.tidakterbatas)
                      ? false
                      : true
              : true,
        ),
      ),
    );
  }

  Container HeadingSection({required String title}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600)),
    );
  }
}
