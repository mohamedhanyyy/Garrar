import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_input_decoration.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';

import '../../../../core/widgets/make_order_dialog.dart';

class FourthStep extends StatefulWidget {
  final Function onTap;

  const FourthStep({super.key, required this.onTap});

  @override
  State<FourthStep> createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  late MarineOrderCubit marineOrderCubit;

  @override
  Widget build(BuildContext context) {
    marineOrderCubit = context.read<MarineOrderCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Main Info',
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
                      Text("Booking ID(BK)",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.bookingNumber,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Container Type",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.containerType,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Line",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.shippingLine,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Text(
            'Shipping Info',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),  border: Border.all(
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
                      Text("Shipping Type",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.shippingType ?? "",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Customs Type",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.customType ?? "",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arrival Time",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.arrivalTime ?? "",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Text(
            'Location Info',
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
                      Text("Get-out Location",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.getOutLocation,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Destination Location",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.destinationLocation,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dry Location",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.dryPortLocation,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Get-in Location",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161))),
                      Text(
                        marineOrderCubit.getInLocation,
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
            'Extra Notes',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: TextField(
              maxLines: 3,
              decoration: customInputDecoration(hint: 'Add notes if exists'),

            ),
          ),
          CustomButton(onTap: () {
            makeOrderDialog(context: context);

          }, buttonText: 'Confirm Order')
        ],
      ),
    );
  }
}
