import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/utils/dialouges.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_decoration.dart';
import '../../cubit/marine_order_cubit.dart';

class ThirdStep extends StatefulWidget {
  List<String> data = [
    'cairo',
    'giza',
    'alex',
    'matroh',
    'fayoum',
  ];
  Function onTap;

  ThirdStep({super.key, required this.onTap});

  @override
  State<ThirdStep> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  late final MarineOrderCubit marineOrderCubit;

  @override
  initState() {
    super.initState();
    marineOrderCubit = context.read<MarineOrderCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate('Get-Out Location'),
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
                  isExpanded: true,
                  hint:   Text(translate('Choose Destination Location')),
                  disabledHint:   Text(translate('Choose Destination Location')),
                  decoration:
                      customDropdownDecoration(image: IconsManager.place),
                  borderRadius: BorderRadius.circular(15),
                  items: widget.data.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  value: marineOrderCubit.getOutLocation != ""
                      ? marineOrderCubit.getOutLocation
                      : widget.data.first,
                  onChanged: (String? val) {
                    setState(() {
                      marineOrderCubit.getOutLocation = val!;
                    });
                  }),
            ),
          ),
          Text(translate('Destination location'),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFAFAFA),
                  border: Border.all(color: Colors.black)),
              child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration:
                      customDropdownDecoration(image: IconsManager.place),
                  borderRadius: BorderRadius.circular(15),
                  items: widget.data.map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem<String>(value: e, child: Text(e));
                  }).toList(),
                  value: marineOrderCubit.destinationLocation != ''
                      ? marineOrderCubit.destinationLocation
                      : widget.data.first,
                  onChanged: (String? val) {
                    setState(() {
                      marineOrderCubit.destinationLocation = val!;
                    });
                  }),
            ),
          ),
          Text(translate('Dry Port location'),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFAFAFA),
                  border: Border.all(color: Colors.black)),
              child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration:
                      customDropdownDecoration(image: IconsManager.place),
                  borderRadius: BorderRadius.circular(15),
                  items: widget.data.map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem<String>(value: e, child: Text(e));
                  }).toList(),
                  value: marineOrderCubit.dryPortLocation != ''
                      ? marineOrderCubit.dryPortLocation
                      : widget.data.first,
                  onChanged: (String? val) {
                    setState(() {
                      marineOrderCubit.dryPortLocation = val!;
                    });
                  }),
            ),
          ),
          Text(translate('Get-In location'),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFAFAFA),
                  border: Border.all(color: Colors.black)),
              child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration:
                      customDropdownDecoration(image: IconsManager.place),
                  borderRadius: BorderRadius.circular(15),
                  items: widget.data.map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem<String>(value: e, child: Text(e));
                  }).toList(),
                  value: marineOrderCubit.getInLocation != ''
                      ? marineOrderCubit.getInLocation
                      : widget.data.first,
                  onChanged: (String? val) {
                    setState(() {
                      marineOrderCubit.getInLocation = val!;
                    });
                  }),
            ),
          ),
          CustomButton(
            onTap: () {
              if (marineOrderCubit.getInLocation != '' &&
                  marineOrderCubit.destinationLocation != '' &&
                  marineOrderCubit.destinationLocation != '' &&
                  marineOrderCubit.dryPortLocation != '') {
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
    );
  }
}
