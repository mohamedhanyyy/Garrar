import 'package:flutter/material.dart';
import 'package:garrar/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final double? borderRadius;
  final Size? size;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.onTap,
    this.size,
    required this.buttonText,
    this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50), // NEW
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
          )),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
  }
}
