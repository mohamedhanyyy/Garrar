import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';

class FourthStep extends StatefulWidget {
  List<String> data = [
    'cairo',
    'giza',
    'alex',
    'matroh',
    'fayoum',
  ];
  Function onTap;

  FourthStep({super.key, required this.onTap});

  @override
  State<FourthStep> createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
