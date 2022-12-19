import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/core/utils/images.dart';

import '../../../core/widgets/custom_input_decoration.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 7.h),
          child: Image.asset(
            ImagesManager.logo1,
            width: 27.w,
            height: 27.h,
          ),
        ),
        title: Text(
          'My Orders',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        actions: [
          GestureDetector(
            child: SvgPicture.asset(IconsManager.boat),
            onTap: () {
              NavigationManager.navigateToPage(context: context, routeName: 'marineOrderScreen');
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              child: SvgPicture.asset(IconsManager.shipping),
              onTap: () {
                NavigationManager.navigateToPage(context: context, routeName: 'domesticOrderScreen');

              },
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 27.h),
                  child: TextField(
                    decoration: customInputDecoration(
                      prefixIcon: IconsManager.search,
                      hint: 'Enter booking number (BK)',
                    ),
                  ),
                ),
                TabBar(
                  physics: const BouncingScrollPhysics(),
                  onTap: (count) {
                    setState(() {
                      currentIndex = count;
                    });
                  },
                  unselectedLabelColor: Colors.grey,
                  labelColor: ColorsManager.primary,
                  labelStyle: TextStyle(
                      color: ColorsManager.primary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                  tabs: const [
                    Tab(
                      text: 'Draft Orders',
                    ),
                    Tab(
                      text: 'All Orders',
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
