import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/core/utils/images.dart';
import 'package:garrar/features/my_orders/view/widgets/my_order_widget.dart';
import '../../../core/widgets/custom_text_field.dart';

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
          padding: EdgeInsets.only(left: 10.w, top: 8.h),
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
          InkWell(
            child: SvgPicture.asset(IconsManager.boat),
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: InkWell(
              child: SvgPicture.asset(IconsManager.shipping),
              onTap: () {},
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
                      prefixIcon: Icons.search,
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
