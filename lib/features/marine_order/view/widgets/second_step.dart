import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/dialouges.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../injector.dart';

class SecondStep extends StatefulWidget {
  Function onTap;

  SecondStep({super.key, required this.onTap});

  @override
  State<SecondStep> createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  String? shippingType;

  String? arrivalTime;

  XFile? bookingFile;

  ImagePicker picker = ImagePicker();
  Dialogues dialogues = locator<Dialogues>();

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
              onChanged: (val) {
                shippingType = val;
              },
              onSaved: (val) {
                shippingType = val!;
              },
              decoration: customInputDecoration(
                  hint: 'Enter booking number (BK)',
                  prefixIcon: Icons.fingerprint_rounded),
            ),
          ),
          Text('Customs Type',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          bookingFile == null
              ? Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
                  child: InkWell(
                    onTap: () async {
                      XFile? image;

                      dialogues.cameraDialog(
                          context: context,
                          onCameraTap: () async {
                            image = await picker.pickImage(
                                source: ImageSource.camera);
                          },
                          onGalleryTap: () async {
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                          });
                      if (image != null) {
                        setState(() {
                          bookingFile = image;
                        });
                      }
                    },
                    child: TextField(
                      enabled: false,
                      decoration: customInputDecoration(
                        hint: 'Choose Customs Type',
                        prefixIcon: Icons.file_copy_sharp,
                        suffixIcon: Icons.upload,
                      ),
                    ),
                  ),
                )
              : Image.file(
                  File(bookingFile!.path),
                  height: 100,
                  width: 100,
                ),
          Text('Arrival Time',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 160.h),
            child: TextFormField(
              enabled: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime(2022),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2023),
                ).then((value) {
                  setState(() {
                    arrivalTime = value.toString();
                  });
                });
              },
              decoration: customInputDecoration(
                  hint: arrivalTime ?? 'Set destination arrival time'),
            ),
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate() &&
                  shippingType != null &&
                  arrivalTime != null &&
                  bookingFile != null) {
                formKey.currentState!.save();
                widget.onTap();
              } else {
                showFillDataDialog(context: context);
              }
            },
            buttonText: 'Continue',
          ),
        ],
      ),
    );
  }
}
