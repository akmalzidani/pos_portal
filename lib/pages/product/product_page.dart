import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/button.dart';
import 'package:pos_portal/widgets/card_action.dart';
import 'package:pos_portal/widgets/topbar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  final tabs = const[
    Tab(
      text: "Semua",
    ),
    Tab(
      text: "Menipis",
    ),
    Tab(
      text: "Terlaris",
    ),
  ];
  TabController ? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Produk',),
      body: BodyTemplate(
        child: Column(
          children: [
            CardAction(
              isImport: true,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    tabs: tabs,
                    indicatorColor: MyColors.primary,
                  ),
                ),
              ],
            ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: [
            //       CardHistory(),
            //       CardHistory(),
            //       CardHistory(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonDefault( // Ubah ButtonDefault menjadi Button
        title: 'Tambah Produk',
      ),
    );
  }
}

class CardHistory extends StatelessWidget {
  const CardHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 0,
      color: MyColors.info,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
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
      ),
    );
  }
}