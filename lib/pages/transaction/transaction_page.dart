import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/card_list_transaction.dart';
import 'package:pos_portal/widgets/empty_page.dart';
import 'package:pos_portal/widgets/search_field.dart';
import 'package:pos_portal/widgets/topbar.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final List<Map<String, dynamic>> transactions = [
    {
      'totalTransaksi': 100000,
      'idTransaksi': '1234567890',
      'tglTransaksi': '6 Mei 2024',
      'jamTransaksi': '09.28',
      'isBerhasil': true,
    },
    {
      'totalTransaksi': 200000,
      'idTransaksi': '0987654321',
      'tglTransaksi': '5 Mei 2024',
      'jamTransaksi': '15.45',
      'isBerhasil': false,
    },
    {
      'totalTransaksi': 300000,
      'idTransaksi': '1122334455',
      'tglTransaksi': '4 Mei 2024',
      'jamTransaksi': '12.30',
      'isBerhasil': true,
    },
    {
      'totalTransaksi': 150000,
      'idTransaksi': '6677889900',
      'tglTransaksi': '3 Mei 2024',
      'jamTransaksi': '08.00',
      'isBerhasil': false,
    },
    {
      'totalTransaksi': 250000,
      'idTransaksi': '5566778899',
      'tglTransaksi': '2 Mei 2024',
      'jamTransaksi': '19.15',
      'isBerhasil': true,
    },
  ];

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Transaksi', isNeedActions: true),
      body: BodyTemplate(
        child: Column(
          children: [
            SearchField(
              controller: searchController,
              isAdaBatal: false,
            ),
            // EmptyList(
            //   title: 'Belum ada produk yang anda tambahkan',
            // ),
            CardListTransaction(
              transactions: transactions,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
