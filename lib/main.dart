import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/pages/home/home_page.dart';
import 'package:pos_portal/pages/product/product_page.dart';
import 'package:pos_portal/pages/settings/settings_page.dart';
import 'package:pos_portal/pages/transaction/transaction_page.dart';
import 'package:pos_portal/utils/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final int? initialIndex;
  const MainScreen({super.key, this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: initialIndex ?? 0),
      screens: const [
        HomePage(),
        ProductPage(),
        TransactionPage(),
        SettingPage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          title: "Beranda",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
          title: "Produk",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.receipt_long),
          inactiveIcon: const Icon(Icons.receipt_long_outlined),
          title: "Transaksi",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          inactiveIcon: const Icon(Icons.settings_outlined),
          title: "Pengaturan",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
