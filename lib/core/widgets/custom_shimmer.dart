import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20.h,
        ),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.h,
            mainAxisSpacing: 15.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: ColorsManager.gray,
              highlightColor: Colors.white,
              child: Container(
                height: ScreenUtil().screenHeight / 2.7,
                width: 75.w,
                color: Colors.black,
              ),
            );
          },
        ),
      ],
    );
  }
}
