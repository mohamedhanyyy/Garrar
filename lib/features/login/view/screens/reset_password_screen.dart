import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/utils/images.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_text_field.dart';

import '../../../../../core/widgets/back_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const SizedBox(width: 18, height: 12, child: BackButtonWidget()),
        title: Text(
          "Reset Password",
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
                    'Please open link sent to your email for reset password',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  ),
                ),
                TextFormField(
                  decoration: customInputDecoration(
                      hint: 'Enter email', prefixIcon: Icons.email),
                ),
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
