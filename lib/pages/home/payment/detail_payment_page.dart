import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/home/payment/payment_method_page.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/input_field.dart';
import 'package:pos_portal/widgets/topbar.dart';
import 'dart:async';

class DetailPaymentPage extends StatefulWidget {
  final int transactionId;
  final int totalTransaksi;
  final List<Map<String, dynamic>> selectedItems;
  const DetailPaymentPage(
      {super.key,
      required this.transactionId,
      required this.totalTransaksi,
      required this.selectedItems});

  @override
  State<DetailPaymentPage> createState() => _DetailPaymentPageState();
}

class _DetailPaymentPageState extends State<DetailPaymentPage> {
  TextEditingController uangDiterimaController = TextEditingController();
  int? uangDiterima = 0;
  int? kembalian;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Detail Pembayaran',
        isCanBack: true,
      ),
      body: BodyTemplate(
        child: Column(
          children: [
            CardDetailPesanan(
              orderDetails: widget.selectedItems,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 36),
                    child: InputField(
                      controller: uangDiterimaController,
                      hintText: 'Rp 0',
                      label: 'Uang Diterima',
                      isDuit: true,
                      onNilaiAngkaChanged: (value) {
                        setState(() {
                          uangDiterima = value;
                          if (uangDiterima! >= widget.totalTransaksi) {
                            kembalian = uangDiterima! - widget.totalTransaksi;
                          } else {
                            kembalian = 0;
                          }
                        });
                      },
                    ),
                  ),
                  TotalKembalian(widget: widget, kembalian: kembalian),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: FloatingButtonDefault(
          title: 'Bayar',
          actionPressed: () {
            (uangDiterima! >= widget.totalTransaksi)
                ? PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PaymentMethodPage(
                      idTransaksi: widget.transactionId,
                      totalTransaksi: widget.totalTransaksi,
                      uangKembalian: kembalian!,
                    ),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  )
                : null;
          },
          heroTag: 'toMetodeBayar',
          isFilled: true,
          isDisabled: !(uangDiterima! >= widget.totalTransaksi),
        ),
      ),
    );
  }
}

class TotalKembalian extends StatelessWidget {
  const TotalKembalian({
    super.key,
    required this.widget,
    required this.kembalian,
  });

  final DetailPaymentPage widget;
  final int? kembalian;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.neutral),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Pesanan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Rp ${formatRupiah(widget.totalTransaksi)}',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: 1,
              child: Container(
                color: MyColors.neutral,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Uang Kembalian',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Rp ${formatRupiah((kembalian ?? 0))}',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: MyColors.onSecondary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardDetailPesanan extends StatelessWidget {
  final List<Map<String, dynamic>> orderDetails;

  const CardDetailPesanan({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.secondaryDisabled,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: MyColors.primary,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Detail Pesanan',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16),
                    Table(
                      border: TableBorder.all(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.circular(5)),
                      columnWidths: {
                        0: FixedColumnWidth(35.0),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(40.0),
                        3: FixedColumnWidth(100.0),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                              color: MyColors.tertiary,
                              borderRadius: BorderRadius.circular(5)),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Nama Produk',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Qty',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Harga',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (int i = 0; i < orderDetails.length; i++)
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${i + 1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  orderDetails[i]['name'],
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'x${orderDetails[i]['quantity']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Rp ${formatRupiah(orderDetails[i]['price'])}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
