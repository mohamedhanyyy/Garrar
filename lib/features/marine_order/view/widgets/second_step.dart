import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SecondStep extends StatelessWidget {
  Function onTap;

  String shippingType = '';
  String customType = '';
  String arrivalTime = '';

  SecondStep({super.key, required this.onTap});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping Type',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Empty booking number';
                }
                return null;
              },
              onSaved: (val) {},
              decoration: customInputDecoration(
                  hint: 'Enter booking number (BK)',
                  prefixIcon: Icons.fingerprint_rounded),
            ),
          ),
          Text('Customs Type',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: TextFormField(
              onSaved: (val) {
                customType = val!;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Enter custom type';
                }
                return null;
              },
              decoration: customInputDecoration(
                hint: 'Choose Customs Type',
                prefixIcon: Icons.file_copy_sharp,
                suffixIcon: Icons.upload,
              ),
            ),
          ),
          Text('Arrival Time',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 160.h),
            child: TextFormField(
              decoration:
                  customInputDecoration(hint: 'Set destination arrival time'),
            ),
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                onTap();
              }
            },
            buttonText: 'Continue',
          ),
        ],
      ),
    );
  }
}
