import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/widgets/custom_button.dart';

Widget buildFirstOrderWidget() {
  return const Text("First");
}

Widget buildSecondOrderWidget() {
  return const Text("second");
}

Container buildOrderWidget({
  required String image,
  required String text,
  required String subText,
  required String status,
  required String date,
}) {
  return Container(
    height: 150.h,
    width: 322.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18.r),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 18.h,
      vertical: 12.h,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              image,
              width: 18.w,
              height: 18.h,
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  subText,
                  style: TextStyle(
                    color: const Color(0xff616161),
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 30.w,
            ),
            Card(
              color: const Color(0xff616161),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text(
              date,
              style: TextStyle(
                  color: const Color(0xff616161),
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            ),
            CustomButton(
              onTap: () {},
              buttonText: 'Track',
            )
          ],
        )
      ],
    ),
  );
}
