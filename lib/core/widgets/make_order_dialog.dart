import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/images.dart';
import 'package:garrar/core/widgets/custom_button.dart';

void makeOrderDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext _) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      contentPadding:
          EdgeInsets.only(top: 45.h, bottom: 35.h, left: 30.w, right: 30.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagesManager.logo1),
          SizedBox(
            height: 33.h,
          ),
          Text(
             ("Make Order".tr()),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Text(
             ("Your Package Will Be Shipped".tr()),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
            onTap: () {
              NavigationManager.navigateReplacementToPage(
                  context: context, routeName: 'completeOrderScreen');
            },
            buttonText: 'Continue',
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
            fontColor: ColorsManager.primary,
            color: const Color(0xffCCEFED),
            onTap: () {
              NavigationManager.navigateReplacementToPage(
                  context: context, routeName: 'homeScreen');
            },
            buttonText: 'Home',
          ),
        ],
      ),
    ),
  );
}
