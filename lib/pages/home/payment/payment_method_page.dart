import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/home/payment/qris_payment_page.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/card_total_transaksi.dart';
import 'package:pos_portal/widgets/copy_clipboard.dart';
import 'package:pos_portal/widgets/dialog_tunai.dart';
import 'package:pos_portal/widgets/topbar.dart';

class PaymentMethodPage extends StatefulWidget {
  final int idTransaksi;
  final int totalTransaksi;

  const PaymentMethodPage(
      {super.key, this.totalTransaksi = 10000, this.idTransaksi = 789567123});

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrisPaymentPage(
                transactionId: idTransaksi,
                totalTransaksi: widget.totalTransaksi,
              ),
            ),
          );
        }
        if (title == 'Tunai') {
          _showDialogTunai();
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

  Future<void> _showDialogTunai() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DialogTunai(
          totalPesanan: widget.totalTransaksi,
        );
      },
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
