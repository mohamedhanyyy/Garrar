import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/utils/images.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 85.h, bottom: 85.h),
                    child: Image.asset(
                      ImagesManager.logo2,
                      width: 150.w,
                      height: 150.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                    child: const Text(
                      'Lets you in',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
                    ),
                  ),
                  TextFormField(
                    decoration: customInputDecoration(
                      hint: 'enter email',
                      prefixIcon: (Icons.email),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Empty email';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 17,
                    ),
                    child: TextFormField(
                      decoration: customInputDecoration(
                          hint: 'enter password',
                          prefixIcon: (Icons.lock),
                          suffixIcon: Icons.visibility),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 38,
                    ),
                    child: CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                      buttonText: 'Sign in',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorsManager.primary,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
