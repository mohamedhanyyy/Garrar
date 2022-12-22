import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration customInputDecoration({
  String? hintText,
  String? suffixIcon,
  String? prefixIcon,
  Color? hintColor,
  bool? enabled,
}) {
  return InputDecoration(
    hintText: hintText!.tr(),
    hintStyle: TextStyle(
      color: hintColor ?? const Color(0xffC0C0C0),
    ),
    enabled: enabled ?? true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    fillColor: const Color(0xffFAFAFA),
    filled: true,
    prefixIconConstraints: BoxConstraints(
      minHeight: 2.h,
      minWidth: 10.w,
    ),
    suffixIconConstraints: BoxConstraints(
      minHeight: 2.h,
      minWidth: 10.w,
    ),
    suffixIcon: suffixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              height: 15,
              child: SvgPicture.asset(suffixIcon),
            ),
          )
        : null,
    prefixIcon: prefixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              height: 15,
              child: SvgPicture.asset(prefixIcon),
            ),
          )
        : null,
  );
}

OutlineInputBorder customOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(9),
);

InputDecoration customDropdownDecoration({required String image}) {
  return InputDecoration(
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    prefixIcon: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 15.h,
        child: SvgPicture.asset(image),
      ),
    ),
    prefixIconConstraints: BoxConstraints(
      minHeight: 2.h,
      minWidth: 10.w,
    ),
  );
}
