import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/floating_button.dart';

class SuccessPaymentPage extends StatelessWidget {
  final bool isTunai;
  final int? totalTransaksi;
  final int? uangKembalian;
  final int idTransaksi;
  final bool isQRIS;
  final bool isUangPas;
  const SuccessPaymentPage(
      {super.key,
      this.isTunai = false,
      this.isQRIS = false,
      this.isUangPas = false,
      this.totalTransaksi,
      this.uangKembalian,
      required this.idTransaksi});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1B6ED4),
                Color(0xFF051529),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: EdgeInsets.all(48),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF3F7FC),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.asset('assets/success.json',
                          width: 200, height: 200),
                      Image.asset('assets/success.png',
                          width: 120, height: 120),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Transaksi Sukses',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColors.onSecondary),
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: 'ID Transaksi: ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: idTransaksi.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColors.primary,
                    ),
                    child: Column(
                      children: [
                        Text(
                          isTunai
                              ? 'Metode Pembayaran: TUNAI'
                              : 'Metode Pembayaran: QRIS',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 0.3,
                        ),
                        Text(
                          isTunai
                              ? (isUangPas
                                  ? 'Uang Pas'
                                  : 'Uang Kembalian: Rp ${formatRupiah(uangKembalian!)}')
                              : 'Total Bayar: Rp ${formatRupiah(totalTransaksi!)}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingButtonDefault(
                  title: 'Cetak Struk',
                  actionPressed: () {},
                  heroTag: 'cetakStruk',
                ),
                FloatingButtonDefault(
                  title: 'Selesai',
                  actionPressed: () {
                    Navigator.of(context).popUntil(ModalRoute.withName("/"));
                  },
                  heroTag: 'selesaiTransaksi',
                  isTransparent: true,
                  isFilled: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
