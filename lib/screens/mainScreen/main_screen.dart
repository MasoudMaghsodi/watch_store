import 'package:flutter/material.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/mainScreen/bascket_screen.dart';
import 'package:watch_store/screens/mainScreen/home_screen.dart';
import 'package:watch_store/screens/mainScreen/profile_screen.dart';
import 'package:watch_store/widgets/btm_nav_item.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();
  static const int home = 0;
  static const int bascket = 1;
  static const int profile = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double btmNavHeight = size.height * 0.1;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: btmNavHeight,
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                HomeScreen(),
                BascketScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: btmNavHeight,
              color: AppColors.btmNavColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BtmNavItem(
                    iconSvgPath: Assets.svg.user,
                    text: AppStrings.profile,
                    onTap: () =>
                        btmNavOnPressed(index: BtmNavScreenIndex.profile),
                    isActive: selectedIndex == BtmNavScreenIndex.profile,
                  ),
                  BtmNavItem(
                    iconSvgPath: Assets.svg.cart,
                    text: AppStrings.basket,
                    onTap: () =>
                        btmNavOnPressed(index: BtmNavScreenIndex.bascket),
                    isActive: selectedIndex == BtmNavScreenIndex.bascket,
                  ),
                  BtmNavItem(
                    iconSvgPath: Assets.svg.home,
                    text: AppStrings.home,
                    onTap: () => btmNavOnPressed(index: BtmNavScreenIndex.home),
                    isActive: selectedIndex == BtmNavScreenIndex.home,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  btmNavOnPressed({required int index}) {
    setState(() {
      selectedIndex = index;
    });
  }
}
