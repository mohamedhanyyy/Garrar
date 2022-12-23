import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../utils/colors.dart';

void showCustomSnackBar({
  required String text,
  Color? backgroundColor,
  Color? textColor,
}) {
  showTopSnackBar(
    OverlayState(),
    CustomSnackBar.info(
      message: text,
      backgroundColor: backgroundColor ?? ColorsManager.primary,
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: textColor ?? Colors.white,
        fontSize: 15.sp,
      ),
      textAlign: TextAlign.center,
    ),
    curve: Curves.bounceInOut,
    dismissType: DismissType.onSwipe,
  );
}
