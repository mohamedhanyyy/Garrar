import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/features/domestic_order/cubit/domestic_order_cubit.dart';
import 'package:garrar/injector.dart';

import '../../../../core/utils/dialouges.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/widgets/custom_input_decoration.dart';

class MainDomesticOrder extends StatefulWidget {
  final Function onTap;

  const MainDomesticOrder({super.key, required this.onTap});

  @override
  State<MainDomesticOrder> createState() => _MainDomesticOrderState();
}

class _MainDomesticOrderState extends State<MainDomesticOrder> {
  Dialogues dialogues = locator<Dialogues>();

  late final DomesticOrderCubit domesticOrderCubit;

  @override
  initState() {
    super.initState();
    domesticOrderCubit = context.read<DomesticOrderCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate('Pickup Location'),
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffFAFAFA),
                border: Border.all(color: Colors.black)),
            child: DropdownButtonFormField(
                focusColor: Colors.transparent,
                isExpanded: true,

                decoration: customDropdownDecoration(image: IconsManager.place),
                borderRadius: BorderRadius.circular(15),
                items: domesticOrderCubit.locations.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                value: domesticOrderCubit.pickUpLocation != ""
                    ? domesticOrderCubit.pickUpLocation
                    : domesticOrderCubit.locations[0],
                onChanged: (String? val) {
                  setState(() {
                    domesticOrderCubit.pickUpLocation = val!;
                  });
                }),
          ),
        ),
        Text(translate('Drop-off Location'),
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
                decoration: customDropdownDecoration(image: IconsManager.place),
                borderRadius: BorderRadius.circular(15),
                items: domesticOrderCubit.locations.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                value: domesticOrderCubit.dropOffLocation != ""
                    ? domesticOrderCubit.dropOffLocation
                    : domesticOrderCubit.locations[0],
                onChanged: (String? val) {
                  setState(() {
                    domesticOrderCubit.dropOffLocation = val!;
                  });
                }),
          ),
        ),
        Text(translate('Arrival Time'),
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
                decoration: customDropdownDecoration(image: IconsManager.place),
                borderRadius: BorderRadius.circular(15),
                items: domesticOrderCubit.locations.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                value: domesticOrderCubit.arrivalTime != ""
                    ? domesticOrderCubit.arrivalTime
                    : domesticOrderCubit.locations[0],
                onChanged: (String? val) {
                  setState(() {
                    domesticOrderCubit.arrivalTime = val!;
                  });
                }),
          ),
        ),
        CustomButton(
          onTap: () {
            if (domesticOrderCubit.dropOffLocation != '' &&
                domesticOrderCubit.pickUpLocation != '' &&
                domesticOrderCubit.arrivalTime != '') {
              widget.onTap();
            } else {
              showFillDataDialog(context: context);
            }
          },
          buttonText: 'Continue',
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
