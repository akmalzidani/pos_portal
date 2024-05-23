import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/home/payment/detail_payment_page.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/card_list_new_transaction.dart';
import 'package:pos_portal/widgets/search_field.dart';
import 'package:pos_portal/widgets/snackbar.dart';
import 'package:pos_portal/widgets/topbar.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({Key? key}) : super(key: key);

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  List<Map<String, dynamic>> selectedItems = [];
  int totalTransaksi = 0;

  void updateSelectedItemsCount(List<Map<String, dynamic>> items, int total) {
    setState(() {
      selectedItems = items;
      totalTransaksi = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Transaksi Baru',
        isCanBack: true,
        onBackPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.of(context).pop();
        },
      ),
      body: BodyTemplate(
        child: Column(
          children: [
            SearchField(
              controller: searchController,
              isAdaBatal: false,
            ),
            CardList(
              onSelectionChanged: updateSelectedItemsCount,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CartDetail(
        selectedItemsCount: selectedItems.length,
        totalTransaksi: totalTransaksi,
        selectedItems: selectedItems,
      ),
    );
  }
}

class CartDetail extends StatelessWidget {
  final int selectedItemsCount;
  final int totalTransaksi;
  final List<Map<String, dynamic>> selectedItems;

  const CartDetail({
    Key? key,
    required this.selectedItemsCount,
    required this.totalTransaksi,
    required this.selectedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: [
                    Container(
                      height: 33,
                      width: 38,
                    ),
                    SvgPicture.asset(
                      'assets/svg/icon_cart.svg',
                      width: 33.25,
                      height: 32.81,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: MyColors.error,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '$selectedItemsCount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 6),
                child: Text(
                  'Total:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                ),
              ),
              Text(
                'Rp ${formatRupiah(totalTransaksi)}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.24,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    selectedItemsCount > 0
                        ? MyColors.primary
                        : MyColors.neutral),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: selectedItemsCount > 0
                  ? () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: DetailPaymentPage(
                          totalTransaksi: totalTransaksi,
                          transactionId: 123456,
                          selectedItems: selectedItems,
                        ),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    }
                  : () {
                      showCustomSnackbar(
                        context: context,
                        message: 'Pilih barang terlebih dahulu',
                        title: 'Belum ada produk yang dipilih',
                        theme: SnackbarTheme.error,
                      );
                    },
              child: Text(
                'Bayar',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
