import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/features/profile/view/profile_screen.dart';

import '../../../core/utils/colors.dart';
import '../../my_orders/view/my_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const MyOrdersScreen(),
    const ProfileScreen(),
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
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeCurrentIndex,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.shipping,
              color: _currentIndex == 0
                  ? ColorsManager.primary
                  : ColorsManager.black.withOpacity(0.5),
            ),
            label: translate('My orders'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.person,
              color: _currentIndex == 1
                  ? ColorsManager.primary
                  : ColorsManager.black.withOpacity(0.5),
            ),
            label: translate('Profile'),
          ),
        ],
      ),
    );
  }
}
