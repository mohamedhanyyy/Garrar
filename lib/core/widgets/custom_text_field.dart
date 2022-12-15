import 'package:flutter/material.dart';

InputDecoration customInputDecoration({
  String? hint,
  IconData? suffixIcon,
  IconData? prefixIcon,
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
    prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
    suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
  );
}

OutlineInputBorder customOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(9),
);
