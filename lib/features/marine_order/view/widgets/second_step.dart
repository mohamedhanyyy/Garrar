import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/dialouges.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';
import 'package:intl/intl.dart';

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
  String? formattedDate;

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
              ('Shipping Type'.tr()),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return ('Empty booking number'.tr());
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
                    hintText: ('Enter booking number (BK)'),
                    prefixIcon: IconsManager.swap),
              ),
            ),
            Text(('Customs Type'.tr()),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return ('Empty custom type'.tr());
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
                  hintText: ('Choose custom type'),
                  prefixIcon: IconsManager.worldLock,
                ),
              ),
            ),
            Text(('Arrival Time'.tr()),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
              child: TextFormField(
                enabled: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(2022),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2023),
                  ).then((value) {
                    marineOrderCubit.arrivalTime = value.toString();

                    setState(() {
                      formattedDate = DateFormat('yyyy-MM-dd').format(value!);
                    });
                  });
                },
                decoration: customInputDecoration(
                    prefixIcon: IconsManager.date,
                    hintText: formattedDate ?? 'Set destination arrival time'.tr()),
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
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
