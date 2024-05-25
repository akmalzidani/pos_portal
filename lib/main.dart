import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/pages/home/home_page.dart';
import 'package:pos_portal/pages/onboarding.dart';
import 'package:pos_portal/pages/product/product_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_portal/pages/settings/settings_page.dart';
import 'package:pos_portal/pages/transaction/transaction_page.dart';
import 'package:pos_portal/utils/colors.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
      // home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: [
        HomePage(),
        ProductPage(),
        TransactionPage(),
        SettingPage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          inactiveIcon: Icon(Icons.home_outlined),
          title: "Beranda",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.shopping_cart),
          inactiveIcon: Icon(Icons.shopping_cart_outlined),
          title: "Produk",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.receipt_long),
          inactiveIcon: Icon(Icons.receipt_long_outlined),
          title: "Transaksi",
          activeColorPrimary: MyColors.primary,
          inactiveColorPrimary: MyColors.neutral,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          inactiveIcon: Icon(Icons.settings_outlined),
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
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
