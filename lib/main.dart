import 'package:flutter/material.dart';
import 'package:pos_portal/pages/home_page.dart';
import 'package:pos_portal/pages/new_transaction_page.dart';
import 'package:pos_portal/pages/stats_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NewTransactionPage(),
      ),
    );
  }
}
