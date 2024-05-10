import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_portal/utils/colors.dart';

class CardMenu extends StatefulWidget {
  const CardMenu({
    super.key,
  });

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          singleMenuCard(context,
              title: 'Produk Menipis', value: '10', icon: 'menipis'),
          singleMenuCard(context,
              title: 'Total Stok Barang', value: '10', icon: 'stok'),
          singleMenuCard(context,
              title: 'Total Transaksi', value: '10', icon: 'transaksi'),
        ],
      ),
    );
  }

  Container singleMenuCard(BuildContext context,
      {required String title, required String value, required String icon}) {
    Color textColor;
    if (icon == 'menipis') {
      textColor = MyColors.error;
    } else if (icon == 'stok') {
      textColor = MyColors.primary;
    } else if (icon == 'transaksi') {
      textColor = MyColors.success;
    } else {
      textColor = Colors.white; // Warna default jika tidak sesuai
    }
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25), // Warna shadow
            blurRadius: 2, // Blur radius
            offset: const Offset(0, 2), // Offset y = 2
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: MyColors.neutral,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.28,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/icon_${icon}.svg',
                      width: 27.98, height: 24.49),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
