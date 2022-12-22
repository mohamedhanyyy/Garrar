import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/widgets/back_button.dart';
import 'package:garrar/features/domestic_order/view/finish_domestic_order.dart';
import 'package:garrar/features/domestic_order/view/widgets/main_domestic_order.dart';
import 'package:im_stepper/stepper.dart';

class DomesticOrderScreen extends StatefulWidget {
  const DomesticOrderScreen({super.key});

  @override
  State<DomesticOrderScreen> createState() => _DomesticOrderScreenState();
}

class _DomesticOrderScreenState extends State<DomesticOrderScreen> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: activeStep == 0 ? BackButtonWidget(context: context) : null,
        title: Text(
           ('Make Domestic Order'.tr()),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NumberStepper(
                lineDotRadius: 1,
                numbers: const [1, 2],
                numberStyle: const TextStyle(
                  color: Colors.white,
                ),
                activeStepColor: ColorsManager.primary,
                activeStepBorderColor: Colors.black,
                lineColor: Colors.grey,
                stepColor: Colors.grey,
                activeStep: activeStep,
                steppingEnabled: true,
                enableStepTapping: false,
                enableNextPreviousButtons: false,
                onStepReached: (val) {
                  setState(() {
                    activeStep = val;
                  });
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(
                height: 20.h,
              ),
              if (activeStep == 0)
                MainDomesticOrder(onTap: () {
                  setState(() {
                    activeStep = 1;
                  });
                }),
              if (activeStep == 1)
                FinishDomesticOrder(onTap: () {
                  setState(() {
                    activeStep = 2;
                  });
                }),
            ],
          ),
        ),
      ),
    );
  }
}
