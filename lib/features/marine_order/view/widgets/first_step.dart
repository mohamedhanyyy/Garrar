import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_text_field.dart';
import 'package:garrar/injector.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/dialouges.dart';

class FirstStep extends StatefulWidget {
  Function onTap;

  FirstStep({super.key, required this.onTap});

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  int containerNumber = 0;
  String containerType = '';
  String shippingLine = '';
  String bookingNumber = '';
  XFile? bookingFile;
  ImagePicker picker = ImagePicker();

  List<String> data = [
    'cairo',
    'giza',
    'alex',
    'matroh',
    'fayoum',
  ];

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
              onChanged: (x) {
                bookingNumber = x;
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
                    child: TextFormField(
                      enabled: false,
                      decoration: customInputDecoration(
                        hint: 'Enter booking file',
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
          Text('Containers type',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFAFAFA),
                  border: Border.all(color: Colors.black)),
              child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Containers type'),
                  disabledHint: const Text('Containers type'),
                  underline: const SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(15),
                  items: ['Import', 'Export', 'Other'].map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  value: containerType != "" ? containerType : 'Import',
                  onChanged: (String? val) {
                    setState(() {
                      containerType = val!;
                    });
                  }),
            ),
          ),
          Text(
            'Containers Count',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                containerNumber = int.parse(val);
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Empty Container Count';
                }
                return null;
              },
              onSaved: (val) {
                containerNumber = int.parse(val!);
              },
              decoration: customInputDecoration(
                hint: 'Container Count',
              ),
            ),
          ),
          Text('Shipping line',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFAFAFA),
                  border: Border.all(color: Colors.black)),
              child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Shipping line'),
                  disabledHint: const Text('Choose Shipping line'),
                  underline: const SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(15),
                  items: data.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  value: shippingLine != "" ? shippingLine : data.first,
                  onChanged: (String? val) {
                    setState(() {
                      shippingLine = val!;
                    });
                  }),
            ),
          ),
          CustomButton(
            onTap: () {
              print(bookingFile);
              print(containerNumber);
              print(containerType);
              print(shippingLine);
              print(bookingNumber);

              if (formKey.currentState!.validate() &&
                  containerNumber != 0 &&
                  containerType != '' &&
                  shippingLine != '' &&
                  bookingNumber != '' &&
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
