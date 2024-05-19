import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/home/payment/qris_payment_page.dart';
import 'package:pos_portal/pages/home/payment/success_payment_page.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/card_total_transaksi.dart';
import 'package:pos_portal/widgets/copy_clipboard.dart';
import 'package:pos_portal/widgets/dialog_tunai.dart';
import 'package:pos_portal/widgets/topbar.dart';

class PaymentMethodPage extends StatefulWidget {
  final int idTransaksi;
  final int totalTransaksi;
  final int uangKembalian;

  const PaymentMethodPage(
      {super.key,
      required this.totalTransaksi,
      required this.idTransaksi,
      required this.uangKembalian});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        title: 'Metode Pembayaran',
        isCanBack: true,
        context: context,
      ),
      body: BodyTemplate(
          child: Column(
        children: [
          CardTotalTransaksi(
            transactionId: widget.idTransaksi,
            totalTransaksi: widget.totalTransaksi,
          ),
          CashOrQris(title: 'QRIS', idTransaksi: widget.idTransaksi),
          CashOrQris(
            title: 'Tunai',
            idTransaksi: widget.idTransaksi,
          ),
        ],
      )),
    );
  }

  GestureDetector CashOrQris(
      {required String title, required int idTransaksi}) {
    return GestureDetector(
      onTap: () {
        if (title == 'QRIS') {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SuccessPaymentPage(
              idTransaksi: widget.idTransaksi,
              totalTransaksi: widget.totalTransaksi,
              isQRIS: true,
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
        if (title == 'Tunai') {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SuccessPaymentPage(
              idTransaksi: widget.idTransaksi,
              totalTransaksi: widget.totalTransaksi,
              isTunai: true,
              isUangPas: widget.uangKembalian == 0,
              uangKembalian: widget.uangKembalian,
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.only(top: 16),
        elevation: 0,
        color: MyColors.secondaryDisabled,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/logo_${title.toLowerCase()}.svg',
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Text textBiasa({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
