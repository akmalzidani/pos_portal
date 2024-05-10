import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';

class newTransactionPage extends StatefulWidget {
  const newTransactionPage({super.key});

  @override
  State<newTransactionPage> createState() => _newTransactionPageState();
}

class _newTransactionPageState extends State<newTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 24,
            color: MyColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Transaksi Baru',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
