import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../core/widgets/custom_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  final OtpFieldController otpController = OtpFieldController();

  VerifyEmailScreen({super.key});

  String optValue='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  onChanged: (val){
                   optValue=val;
                  },
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: ColorsManager.primary,
                      backgroundColor: ColorsManager.primary.withOpacity(0.2),
                      focusBorderColor: Colors.green,
                      disabledBorderColor: Colors.grey,

                    ),

                    controller: otpController,
                    length: 6,
                    width: context.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45.w,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15.r,
                    style: TextStyle(fontSize: 17.sp),
                    keyboardType: TextInputType.phone,
                ),

                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didnt receive OTP ?',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorsManager.black,
                      ),
                    ),
                      SizedBox(
                      width: 13.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Try again',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 38.h,
                  ),
                  child: CustomButton(
                    onTap: () {
                      if(optValue.length==6 ) {
                        NavigationManager.navigateReplacementToPage(
                          context: context, routeName: 'homeScreen');
                      }
                    },
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
