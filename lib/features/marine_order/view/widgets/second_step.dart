import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/dialouges.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';

import '../../../../core/utils/icons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_decoration.dart';
import '../../../../injector.dart';

class SecondStep extends StatefulWidget {
  final Function onTap;

  const SecondStep({super.key, required this.onTap});

  @override
  State<SecondStep> createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  Dialogues dialogues = locator<Dialogues>();

  late final MarineOrderCubit marineOrderCubit;

  @override
  initState() {
    super.initState();
    marineOrderCubit = context.read<MarineOrderCubit>();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
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
                  marineOrderCubit.shippingType = val;
                },
                onSaved: (val) {
                  marineOrderCubit.shippingType = val!;
                },
                decoration: customInputDecoration(
                    hint: 'Enter booking number (BK)',
                    prefixIcon: IconsManager.swap),
              ),
            ),
            Text('Customs Type',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty custom type';
                  }
                  return null;
                },
                onChanged: (val) {
                  marineOrderCubit.customType = val;
                },
                onSaved: (val) {
                  marineOrderCubit.customType = val!;
                },
                decoration: customInputDecoration(
                  hint: 'Choose custom type',
                  prefixIcon: IconsManager.worldLock,
                ),
              ),
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
                      marineOrderCubit.arrivalTime = value.toString();
                    });
                  });
                },
                decoration: customInputDecoration(
                    prefixIcon: IconsManager.date,
                    hint: marineOrderCubit.arrivalTime ??
                        'Set destination arrival time'),
              ),
            ),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate() &&
                    marineOrderCubit.shippingType != null &&
                    marineOrderCubit.arrivalTime != null &&
                    marineOrderCubit.customType != null) {
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
      ),
    );
  }
}
