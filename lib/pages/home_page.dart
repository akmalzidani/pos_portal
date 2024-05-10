import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/button.dart';
import 'package:pos_portal/widgets/card_menu.dart';
import 'package:pos_portal/widgets/card_wallet.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardWallet(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: MyColors.info,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/icon_laris.svg',
                            width: 20,
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: const Text(
                              'Lihat Produk Terlarismu',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              cardMenu(),
              segmentedControl(),
            ],
          ),
        ),
      ),
      floatingActionButton: buttonDefault(
        title: 'Tambah Transaksi',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
