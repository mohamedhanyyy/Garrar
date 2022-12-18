import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garrar/core/utils/icons.dart';

InputDecoration customInputDecoration({
  String? hint,
  IconData? suffixIcon,
  IconData? prefixIcon,
  String? prefix,
}) {
  return InputDecoration(
    hintText: hint,
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
    suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
    prefixIcon: prefix != null
        ? InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                height: 15,
                child: SvgPicture.asset(prefix),
              ),
            ),
            onTap: () {})
        : null,
  );
}

OutlineInputBorder customOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(9),
);


InputDecoration customDropdownDecoration({required String image}){
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
        height: 15,
        child: SvgPicture.asset(image),
      ),
    ),
    prefixIconConstraints: BoxConstraints(
      minHeight: 2.h,
      minWidth: 10.w,
    ),
  );
}