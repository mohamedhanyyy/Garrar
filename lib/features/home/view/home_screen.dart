import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garrar/core/utils/dialouges.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/features/profile/view/profile_screen.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/offline_widget.dart';
import '../../../injector.dart';
import '../../my_orders/view/my_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dialogues dialogues = locator<Dialogues>();
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
    return WillPopScope(
      onWillPop: () {
        return dialogues.onWillPop(context);
      },
      child: Scaffold(
        body: OfflineBuilder(
            debounceDuration: const Duration(seconds: 2),
            connectivityBuilder: (context, ConnectivityResult value, child) {
              if (value == ConnectivityResult.none) {
                return const OfflineWidget();
              }
              return child;
            },
            child: screens[_currentIndex]),
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
              label: 'My Orders'.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconsManager.person,
                color: _currentIndex == 1
                    ? ColorsManager.primary
                    : ColorsManager.black.withOpacity(0.5),
              ),
              label: 'Profile'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
