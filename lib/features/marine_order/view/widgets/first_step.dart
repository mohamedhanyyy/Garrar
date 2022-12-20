import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_input_decoration.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';
import 'package:garrar/injector.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/dialouges.dart';

class FirstStep extends StatefulWidget {
  final Function onTap;

  const FirstStep({super.key, required this.onTap});

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  Dialogues dialogues = locator<Dialogues>();
  final formKey = GlobalKey<FormState>();

  late final MarineOrderCubit marineOrderCubit;
  ImagePicker picker = ImagePicker();

  @override
  initState() {
    super.initState();
    marineOrderCubit = context.read<MarineOrderCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translate('Shipping number'),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return translate('Empty booking number');
                  }
                  return null;
                },
                onChanged: (x) {
                  marineOrderCubit.bookingNumber = x;
                },
                onSaved: (val) {
                  marineOrderCubit.bookingNumber = val!;
                },
                decoration: customInputDecoration(
                    hintText: 'Enter booking number (BK)',
                    prefixIcon: IconsManager.fingerPrint),
              ),
            ),
            Text(translate('Booking file'),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            marineOrderCubit.bookingFirstFile == null
                ? Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
                    child: InkWell(
                      onTap: () async {
                        dialogues.cameraDialog(
                            context: context,
                            onCameraTap: () async {
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.camera);
                              if (image != null) {
                                setState(() {
                                  marineOrderCubit.bookingFirstFile = image;
                                });
                              }
                            },
                            onGalleryTap: () async {
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                setState(() {
                                  marineOrderCubit.bookingFirstFile = image;
                                });
                              }
                            });
                      },
                      child: TextFormField(
                        enabled: false,
                        decoration: customInputDecoration(
                          hintText: 'Enter booking file',
                          suffixIcon: IconsManager.upload,
                          prefixIcon: IconsManager.document,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Card(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              File(marineOrderCubit.bookingFirstFile!.path),
                              height: 120.h,
                              width: 120.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap: () {
                                marineOrderCubit.bookingFirstFile = null;
                                setState(() {});
                              },
                              child: Text(translate('Clear')))
                        ],
                      ),
                    ),
                  ),
            Text(translate('Containers type'),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffFAFAFA),
                    border: Border.all(color: Colors.black)),
                child: DropdownButtonFormField(
                    decoration:
                        customDropdownDecoration(image: IconsManager.place),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(15),
                    items: ['Import', 'Export', 'Other'].map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    value: marineOrderCubit.containerType != ""
                        ? marineOrderCubit.containerType
                        : 'Import',
                    onChanged: (String? val) {
                      setState(() {
                        marineOrderCubit.containerType = val!;
                      });
                    }),
              ),
            ),
            Text(
              translate('Containers Count'),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  marineOrderCubit.containerNumber = int.parse(val);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return translate('Empty Container Count');
                  }
                  return null;
                },
                onSaved: (val) {
                  marineOrderCubit.containerNumber = int.parse(val!);
                },
                decoration: customInputDecoration(
                  hintText: translate('Container Count'),
                ),
              ),
            ),
            Text(translate('Shipping line'),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffFAFAFA),
                    border: Border.all(color: Colors.black)),
                child: DropdownButtonFormField(
                    isExpanded: true,
                    decoration:
                        customDropdownDecoration(image: IconsManager.place),
                    borderRadius: BorderRadius.circular(15),
                    items: marineOrderCubit.data.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    value: marineOrderCubit.shippingLine != ""
                        ? marineOrderCubit.shippingLine
                        : marineOrderCubit.data.first,
                    onChanged: (String? val) {
                      setState(() {
                        marineOrderCubit.shippingLine = val!;
                      });
                    }),
              ),
            ),
            CustomButton(
              onTap: () {
                // print(marineOrderCubit.bookingFirstFile);
                // print(marineOrderCubit.containerNumber);
                // print(marineOrderCubit.containerType);
                // print(marineOrderCubit.shippingLine);
                // print(marineOrderCubit.bookingNumber);

                if (formKey.currentState!.validate() &&
                        marineOrderCubit.containerNumber != 0 &&
                        marineOrderCubit.containerType != '' &&
                        marineOrderCubit.shippingLine != '' &&
                        marineOrderCubit.bookingNumber != ''
                    //&& marineOrderCubit.bookingFirstFile != null
                    ) {
                  formKey.currentState!.save();
                  widget.onTap();
                } else {
                  showFillDataDialog(context: context);
                }
              },
              buttonText: 'Continue',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
