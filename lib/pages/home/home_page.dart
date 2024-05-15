import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/home/new_transaction_page.dart';
import 'package:pos_portal/pages/home/stats_page.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/card_info.dart';
import 'package:pos_portal/widgets/card_menu.dart';
import 'package:pos_portal/widgets/card_wallet.dart';
import 'package:pos_portal/widgets/line_chart.dart';
import 'package:pos_portal/widgets/segmented_control.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyTemplate(child: isiHome()),
      floatingActionButton: FloatingButtonDefault(
        title: 'Tambah Transaksi',
        actionPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewTransactionPage(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class isiHome extends StatelessWidget {
  const isiHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardWallet(),
        CardInfo(),
        CardMenu(),
        SegmentedControl(),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatsPage(),
                ),
              );
            },
            child: LineChart()),
      ],
    );
  }
}
