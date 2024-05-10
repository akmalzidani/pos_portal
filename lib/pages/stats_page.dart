import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/line_chart.dart';
import 'package:pos_portal/widgets/segmented_control.dart';
import 'package:pos_portal/widgets/topbar.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Statistik',
        isCanBack: false,
      ),
      body: BodyTemplate(
          child: Column(
        children: [
          SegmentedControl(),
          LineChart(),
          CardAction(),
          Card(
            margin: EdgeInsets.only(top: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color(0xFFE3E7F7),
                width: 2,
              ),
            ),
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildSubtitleText('Item Terjual'),
                        buildSubtitleText('0 Item'),
                      ],
                    ),
                    SizedBox(height: 10),
                    buildSubtitleText('Transaksi'),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          buildTransactionInfo(
                              'Total Transaksi', '0 Transaksi'),
                          buildTransactionInfo('Total Berhasil', '0 Transaksi'),
                          buildTransactionInfo('Total Gagal', '0 Transaksi'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildSubtitleText('Total Pendapatan'),
                        buildSubtitleText('Rp 0'),
                      ],
                    ),
                  ],
                )),
          )
        ],
      )),
    );
  }
}

Widget buildTransactionInfo(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget buildSubtitleText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Colors.black,
    ),
  );
}
