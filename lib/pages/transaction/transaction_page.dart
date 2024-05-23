import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/card_list_transaction.dart';
import 'package:pos_portal/widgets/search_field.dart';
import 'package:pos_portal/widgets/topbar.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
            CardListTransaction(),
          ],
        ),
      ),
    );
    ;
  }
}
