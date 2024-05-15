import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pos_portal/pages/home/home_page.dart';
import 'package:pos_portal/pages/product/product_page.dart';
import 'package:pos_portal/utils/colors.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({required Key key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [HomePage(), ProductPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/navbar_outlined_1.svg'),
        title: ("Beranda"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: MyColors.neutral,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/navbar_outlined_2.svg'),
        title: ("Produk"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: MyColors.neutral,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/navbar_outlined_3.svg'),
        title: ("Transaksi"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: MyColors.neutral,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/navbar_outlined_4.svg'),
        title: ("Pengaturan"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: MyColors.neutral,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
