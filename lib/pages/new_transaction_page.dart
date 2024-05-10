import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/topbar.dart';

class newTransactionPage extends StatefulWidget {
  const newTransactionPage({super.key});

  @override
  State<newTransactionPage> createState() => _newTransactionPageState();
}

class _newTransactionPageState extends State<newTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Transaksi Baru'),
      body: BodyTemplate(child: Container()),
    );
  }
}
