import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/utils/icons.dart';
import 'package:garrar/core/utils/images.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_input_decoration.dart';
import 'package:garrar/core/widgets/offline_widget.dart';

import '../../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  String email = "";
  String password = "";

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        debounceDuration: const Duration(seconds: 2),
        connectivityBuilder: (context, ConnectivityResult value, child) {
          if (value == ConnectivityResult.none) {
            return const OfflineWidget();
          }
          return child;
        },
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 85.h, bottom: 60.h),
                      child: Image.asset(
                        ImagesManager.logo2,
                        width: 150.w,
                        height: 150.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                      child: Text(
                        "Let's go".tr(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 40),
                      ),
                    ),
                    TextFormField(
                      onSaved: (val) {
                        email = val!;
                      },
                      decoration: customInputDecoration(
                        hintText: 'Email'.tr(),
                        prefixIcon: IconsManager.mailCard,
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty email'.tr();
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25.h,
                        bottom: 17.h,
                      ),
                      child: TextFormField(
                        onSaved: (val) {
                          password = val!;
                        },
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Color(0xffC0C0C0)),
                            border: customOutlineInputBorder,
                            enabledBorder: customOutlineInputBorder,
                            focusedErrorBorder: customOutlineInputBorder,
                            focusedBorder: customOutlineInputBorder,
                            errorBorder: customOutlineInputBorder,
                            disabledBorder: customOutlineInputBorder,
                            filled: true,
                            fillColor: ColorsManager.gray,
                            hintText: 'Password'.tr(),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            )),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty password'.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: checkBox,
                            onChanged: (val) {
                              setState(() {
                                checkBox = val!;
                              });
                            }),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text("Remember me".tr()),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        bottom: 38.h,
                      ),
                      child: CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            context.read<AuthCubit>().login(
                                email: email,
                                password: password,
                                context: context);

                            if (checkBox == true) {
                              //todo action
                            } else {
                              // todo another action
                            }
                          }
                        },
                        buttonText: 'Sign in'.tr(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            NavigationManager.navigateToPage(
                                context: context,
                                routeName: 'resetPasswordScreen');
                          },
                          child: Text(
                            'Forget Password'.tr(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorsManager.primary,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Dont have an account?'.tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                NavigationManager.navigateToPage(
                                    context: context, routeName: 'signupScreen');
                              },
                              child: Text(
                                'Sign up'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorsManager.primary,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
