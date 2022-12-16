import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class FirstStep extends StatelessWidget {
  Function onTap;

  String bookingNumber = '';
  File? bookingFile;

  int containerNumber = 0;
  String shippingLine = '';

  ImagePicker? picker;

  FirstStep({super.key, required this.onTap});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping number',
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
              onSaved: (val) {
                bookingNumber = val!;
              },
              decoration: customInputDecoration(
                  hint: 'Enter booking number (BK)',
                  prefixIcon: Icons.fingerprint_rounded),
            ),
          ),
          Text('Booking file',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: TextFormField(
              onTap: () {
                picker
                    ?.pickImage(source: ImageSource.camera)
                    .then((value) => {bookingFile = File(value!.path)});
              },
              enabled: false,
              decoration: customInputDecoration(
                hint: 'Enter booking file',
                prefixIcon: Icons.file_copy_sharp,
                suffixIcon: Icons.upload,
              ),
            ),
          ),
          Text('Containers number/type',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: TextFormField(
              decoration: customInputDecoration(hint: 'Enter booking number'),
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
