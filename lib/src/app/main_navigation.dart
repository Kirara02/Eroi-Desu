import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:eroi_desu/src/features/favorite/view/favorite_page.dart';
import 'package:eroi_desu/src/features/home/view/home_page.dart';
import 'package:eroi_desu/src/features/profile/view/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../config/constant.dart';
import '../config/theme/colors.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Apakah anda yakin?',
              style: TextStyle(
                color: UIColors.text,
              ),
            ),
            content: const Text(
              'Anda ingin keluar dari aplikasi',
              style: TextStyle(
                color: UIColors.text,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Tidak',
                  style: TextStyle(
                    color: UIColors.text,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Ya',
                  style: TextStyle(
                    color: UIColors.text,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const FavoritePage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, size: 20),
        inactiveIcon: const Icon(Icons.home_outlined, size: 20),
        title: "Home",
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppConstants.kFontSizeS,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: UIColors.white,
        activeColorSecondary: UIColors.white,
        inactiveColorSecondary: UIColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite, size: 20),
        inactiveIcon: const Icon(Icons.favorite_outline, size: 20),
        title: "Favorite",
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppConstants.kFontSizeS,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: UIColors.white,
        activeColorSecondary: UIColors.white,
        inactiveColorSecondary: UIColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, size: 20),
        inactiveIcon: const Icon(Icons.person_outline, size: 20),
        title: "Profile",
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppConstants.kFontSizeS,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: UIColors.white,
        activeColorSecondary: UIColors.white,
        inactiveColorSecondary: UIColors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      resizeToAvoidBottomInset: true,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColors.primaryDark,
        handleAndroidBackButtonPress: true,
        popAllScreensOnTapAnyTabs: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        hideNavigationBar: false,
        onItemSelected: (value) {
          log(value.toString());
        },
        onWillPop: (p0) => _onWillPop(),
        // hideNavigationBar: _hideNavBar,
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInSine,
          duration: Duration(milliseconds: 300),
        ),

        navBarStyle: NavBarStyle.style7,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
