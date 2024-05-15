import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/pages/home/home_page.dart';
import 'package:pos_portal/pages/home/new_transaction_page.dart';
import 'package:pos_portal/pages/home/stats_page.dart';
import 'package:pos_portal/pages/product/product_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePage(),
        // bottomNavigationBar: ,
      ),
    );
  }
}
