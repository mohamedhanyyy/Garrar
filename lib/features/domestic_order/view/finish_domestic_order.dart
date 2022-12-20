import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_input_decoration.dart';
import 'package:garrar/features/domestic_order/cubit/domestic_order_cubit.dart';

import '../../../core/widgets/make_order_dialog.dart';

class FinishDomesticOrder extends StatelessWidget {
  late DomesticOrderCubit domesticOrderCubit;

  final Function onTap;

  FinishDomesticOrder({super.key, required this.onTap});

  String? extraNotes;

  @override
  Widget build(BuildContext context) {
    domesticOrderCubit = context.read<DomesticOrderCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate('Location Info'),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            padding: EdgeInsets.only(
                left: 20.w, top: 16.h, bottom: 16.h, right: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translate("Pickup Location"),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff616161))),
                    Text(
                      domesticOrderCubit.pickUpLocation,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translate("Drop-off Location"),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff616161),
                      ),
                    ),
                    Text(
                      domesticOrderCubit.dropOffLocation,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translate("Arrival Time"),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff616161),
                      ),
                    ),
                    Text(
                      domesticOrderCubit.arrivalTime,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
        Text(
          translate('Extra Notes'),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: TextField(
            onChanged: (val) {
              extraNotes = val;
            },
            maxLines: 3,
            decoration: customInputDecoration(
                hintText: translate('Add notes if exists')),
          ),
        ),
        CustomButton(
            onTap: () {
              makeOrderDialog(context: context);
            },
            buttonText: 'Confirm Order'),
        SizedBox(height: 20.h),
      ],
    );
  }
}
