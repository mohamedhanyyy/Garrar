import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final double? borderRadius;
  final Size? size;
  final Color? fontColor;
  final double? fontSize;
  final Color? color;

  const CustomButton({
    super.key,
    required this.onTap,
    this.size,
    required this.buttonText,
    this.borderRadius,
    this.fontColor,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50.h),
        backgroundColor: color ?? ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
        ),
      ),
      child: Text(
         (buttonText.tr()),
        style: TextStyle(
          color: fontColor ?? Colors.white,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
  }
}
