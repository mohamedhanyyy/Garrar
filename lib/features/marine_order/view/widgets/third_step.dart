import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';

class ThirdStep extends StatefulWidget {
  List<String> data = [
    'cairo',
    'giza',
    'alex',
    'matroh',
    'fayoum',
  ];
  Function onTap;

  ThirdStep({super.key, required this.onTap});

  @override
  State<ThirdStep> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  String getOutLocation = '';

  String getInLocation = '';

  String destinationLocation = '';

  String dryPortLocation = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get-Out Location',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsManager.gray,
                border: Border.all(color: ColorsManager.gray)),
            child: DropdownButton(
                isExpanded: true,
                hint: Text('Choose Destination Location'),
                disabledHint: Text('Choose Destination Location'),
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(15),
                items: widget.data.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                value:
                    getOutLocation != "" ? getOutLocation : widget.data.first,
                onChanged: (String? val) {
                  setState(() {
                    getOutLocation = val!;
                  });
                }),
          ),
        ),
        Text('Destination location',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsManager.gray,
                border: Border.all(color: ColorsManager.gray)),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(15),
                items: widget.data.map<DropdownMenuItem<String>>((String e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
                value: destinationLocation != ''
                    ? destinationLocation
                    : widget.data.first,
                onChanged: (String? val) {
                  setState(() {
                    destinationLocation = val!;
                  });
                }),
          ),
        ),
        Text('Dry Port location',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsManager.gray,
                border: Border.all(color: ColorsManager.gray)),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(15),
                items: widget.data.map<DropdownMenuItem<String>>((String e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
                value:
                    dryPortLocation != '' ? dryPortLocation : widget.data.first,
                onChanged: (String? val) {
                  setState(() {
                    dryPortLocation = val!;
                  });
                }),
          ),
        ),
        Text('Get-In location',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsManager.gray,
                border: Border.all(color: ColorsManager.gray)),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(15),
                items: widget.data.map<DropdownMenuItem<String>>((String e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
                value: getInLocation != '' ? getInLocation : widget.data.first,
                onChanged: (String? val) {
                  setState(() {
                    getInLocation = val!;
                  });
                }),
          ),
        ),
        CustomButton(
          onTap: () {
            if (getInLocation != '' &&
                getOutLocation != '' &&
                destinationLocation != '' &&
                dryPortLocation != '') {
              widget.onTap();
            }
            else
              {

              }
          },
          buttonText: 'Continue',
        ),
      ],
    );
  }
}
