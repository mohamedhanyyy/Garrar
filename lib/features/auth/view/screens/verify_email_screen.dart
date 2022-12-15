import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../../core/widgets/back_button.dart';
import '../../../../core/widgets/custom_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  final OtpFieldController otpController = OtpFieldController();

  VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const SizedBox(width: 18, height: 12, child: BackButtonWidget()),
        title: Text(
          "Verify Email",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 200.h, bottom: 60.h),
                  child: Text(
                    'Please add OTP sent to your email for verification',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  ),
                ),
                OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                        borderColor: ColorsManager.primary,
                        backgroundColor:
                            ColorsManager.primary.withOpacity(0.2)),
                    controller: otpController,
                    length: 5,
                    width: context.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45.w,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15.r,
                    style: TextStyle(fontSize: 17.sp),
                    keyboardType: TextInputType.phone,
                    onCompleted: (pin) {}),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 38,
                  ),
                  child: CustomButton(
                    onTap: () {},
                    buttonText: 'Continue',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
