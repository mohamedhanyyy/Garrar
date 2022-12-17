import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/widgets/back_button.dart';
import 'package:garrar/features/marine_order/view/widgets/first_step.dart';
import 'package:garrar/features/marine_order/view/widgets/fourth_step.dart';
import 'package:garrar/features/marine_order/view/widgets/second_step.dart';
import 'package:garrar/features/marine_order/view/widgets/third_step.dart';
import 'package:im_stepper/stepper.dart';

class MarineOrderScreen extends StatefulWidget {
  const MarineOrderScreen({super.key});

  @override
  State<MarineOrderScreen> createState() => _MarineOrderScreenState();
}

class _MarineOrderScreenState extends State<MarineOrderScreen> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: activeStep == 0 ? BackButtonWidget(context: context) : null,
        title: Text(
          'Make Marine Order',
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
                numbers: const [1, 2, 3, 4],
                numberStyle: const TextStyle(
                  color: Colors.white,
                ),
                stepReachedAnimationEffect: Curves.bounceInOut,
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
                FirstStep(onTap: () {
                  setState(() {
                    activeStep = 1;
                  });
                }),
              if (activeStep == 1)
                SecondStep(onTap: () {
                  setState(() {
                    activeStep = 2;
                  });
                }),
              if (activeStep == 2)
                ThirdStep(onTap: () {
                  setState(() {
                    activeStep = 3;
                  });
                }),
              if (activeStep == 2)
                FourthStep(onTap: () {
                  setState(() {
                    activeStep = 4;
                  });
                }),
            ],
          ),
        ),
      ),
    );
  }
}
