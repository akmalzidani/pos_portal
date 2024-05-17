import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/card_total_transaksi.dart';
import 'package:pos_portal/widgets/topbar.dart';
import 'dart:async';

class DetailPaymentPage extends StatefulWidget {
  final int transactionId;
  final int totalTransaksi;
  const DetailPaymentPage(
      {super.key, required this.transactionId, required this.totalTransaksi});

  @override
  State<DetailPaymentPage> createState() => _DetailPaymentPageState();
}

class _DetailPaymentPageState extends State<DetailPaymentPage> {
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
            CardDetailPesanan(widget: widget),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailPesanan extends StatelessWidget {
  const CardDetailPesanan({
    super.key,
    required this.widget,
  });

  final DetailPaymentPage widget;

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
                    color: MyColors.primary, // Warna tepi card
                    width: 1, // Lebar tepi card
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Detail Pesanan',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Rp ${formatRupiah(widget.totalTransaksi)}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
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
