import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/dummy_product.dart';

class CardProduct extends StatelessWidget {
  final DummyProduct product;

  const CardProduct({required this.product, Key? key}) : super(key: key);

  Color _getStockColor(int stock) {
    if (stock < 4) {
      return MyColors.error;
    } else if (stock < 10) {
      return MyColors.warning;
    } else {
      return MyColors.primary;
    }
  }

  Widget _trailingWidget(int stock) {
    if (product.stock == '123456789') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/icon_cart.svg',
            color: MyColors.success,
            height: 25,
            width: 25,
          ),
          SizedBox(width: 5),
          Text(
            'Stok tidak terbatas',
            style: TextStyle(
              color: MyColors.success,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      );
    }
    else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/icon_cart.svg',
            color: _getStockColor(stock),
            height: 25,
            width: 25,
          ),
          SizedBox(width: 5),
          Text(
            'Stok Sisa ${product.stock}',
            style: TextStyle(
              color: _getStockColor(stock),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int? stock = int.tryParse(product.stock);
    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          title: Text(
            product.name,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            '${product.harga}',
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: MyColors.primary,
            ),
          ),
          trailing: _trailingWidget(stock!),
        ),
      ),
    );
  }
}

class CardProductTerlaris extends StatelessWidget {
  final DummyProduct product;

  const CardProductTerlaris({required this.product, Key? key})
      : super(key: key);

  Widget _trailingWidget(int sold) {
    final isTopThree = listProduct.take(3).any((p) => p.name == product.name);

    if (isTopThree) {
      if (listProduct.indexOf(product) == 0) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/fire_1.svg',
              height: 35,
              width: 35,
            ),
            SizedBox(height: 5), // Spasi antara ikon dan teks
            Text(
              'Terjual $sold Item',
              // Teks menampilkan jumlah item yang telah terjual
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        );
      } else if (listProduct.indexOf(product) == 1) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/fire_2.svg',
              height: 35,
              width: 35,
            ),
            SizedBox(height: 5), // Spasi antara ikon dan teks
            Text(
              'Terjual $sold Item',
              // Teks menampilkan jumlah item yang telah terjual
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        );
      } else if (listProduct.indexOf(product) == 2) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/fire_3.svg',
              height: 35,
              width: 35,
            ),
            SizedBox(height: 5), // Spasi antara ikon dan teks
            Text(
              'Terjual $sold Item',
              // Teks menampilkan jumlah item yang telah terjual
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        );
      }
    }
    else {
      return Text(
        'Terjual $sold Item', // Teks menampilkan jumlah item yang telah terjual
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      );
    }
    return SizedBox(); // Tidak menampilkan apapun untuk produk yang bukan termasuk dalam tiga item terlaris
  }


  @override
  Widget build(BuildContext context) {
    int? sold = int.tryParse(product.terjual);
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 5),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Text(
                product.name,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                '${product.harga}',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: MyColors.primary,
                ),
              ),
              trailing: _trailingWidget(sold!),
            ),
          ),
        ),
        Divider(), // Divider di sini
      ],
    );
  }
}
