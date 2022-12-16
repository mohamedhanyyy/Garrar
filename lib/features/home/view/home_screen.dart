import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/features/order/view/my_orders_screen.dart';
import 'package:garrar/features/profile/view/profile_screen.dart';

import '../../../core/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    MyOrdersScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  void changeCurrentIndex(int count) {
    setState(() {
      _currentIndex = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeCurrentIndex,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.shipping,
              color: _currentIndex == 0
                  ? ColorsManager.primary
                  : ColorsManager.gray,
            ),
            label: 'My orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsManager.boat,
                color: _currentIndex == 1
                    ? ColorsManager.primary
                    : ColorsManager.gray),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
