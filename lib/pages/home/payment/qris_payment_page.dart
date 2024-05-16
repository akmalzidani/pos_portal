import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/card_total_transaksi.dart';
import 'package:pos_portal/widgets/topbar.dart';
import 'dart:async';

class QrisPaymentPage extends StatefulWidget {
  final int transactionId;
  final int totalTransaksi;
  const QrisPaymentPage(
      {super.key, required this.transactionId, required this.totalTransaksi});

  @override
  State<QrisPaymentPage> createState() => _QrisPaymentPageState();
}

class _QrisPaymentPageState extends State<QrisPaymentPage> {
  late Timer timer;
  late int secondsRemaining;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Set jumlah detik awal
    secondsRemaining = 300; // 5 menit
    // Atur timer untuk memperbarui setiap detik
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        }
      });
      // Hentikan timer jika sudah mencapai 0 detik
      if (secondsRemaining == 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Pembayaran',
        isCanBack: true,
      ),
      body: BodyTemplate(
        child: Column(
          children: [
            CardTotalTransaksi(
              transactionId: widget.transactionId,
              isQris: true,
              totalTransaksi: widget.totalTransaksi,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Placeholder(fallbackHeight: 280),
                  CardKadaluarsa(),
                  RefreshQR()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector RefreshQR() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                ' icon_refresh.svg',
                width: 16,
              ),
            ),
            Text(
              'Generate ulang Kode QR',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: MyColors.primary,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Card CardKadaluarsa() {
    // Warna dan teks berubah saat detik mencapai 0
    Color cardColor =
        secondsRemaining == 0 ? MyColors.bgError : MyColors.bgWarning;
    Color textColor = secondsRemaining == 0 ? MyColors.error : MyColors.warning;
    String expirationText = secondsToDuration(secondsRemaining);

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 16),
      color: cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: RichText(
              text: TextSpan(
                text: 'Kode QR ini akan kadaluarsa dalam ',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Montserrat',
                  color: textColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: expirationText,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String secondsToDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '0$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
