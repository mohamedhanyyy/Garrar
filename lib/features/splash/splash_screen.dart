import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () {
      NavigationManager.navigateReplacementToPage(
          context: context, routeName: 'loginScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImagesManager.splash,
          height: context.height,
          width: context.width,
          fit: BoxFit.fill,
        ),
        Positioned(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 196.h, left: 121.w, right: 122.w, bottom: 220.h),
              child: Image.asset(ImagesManager.logo1),
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 40.sp,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              'Garrar',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 82.sp),
            ),
            Text(
              'The best shipping app ever',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ],
        ))
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
}
