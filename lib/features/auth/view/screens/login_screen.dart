import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/utils/images.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_input_decoration.dart';

import '../../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  String email = "";
  String password = "";

  bool checkBox=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                    onSaved: (val) {
                      email = val!;
                    },
                    decoration: customInputDecoration(
                      hint: 'Enter email',
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
                      onSaved: (val) {
                        password = val!;
                      },
                      obscureText: isVisible,
                      decoration: InputDecoration(
                          border: customOutlineInputBorder,
                          enabledBorder: customOutlineInputBorder,
                          focusedErrorBorder: customOutlineInputBorder,
                          focusedBorder: customOutlineInputBorder,
                          errorBorder: customOutlineInputBorder,
                          disabledBorder: customOutlineInputBorder,
                          filled: true,
                          fillColor: ColorsManager.gray,
                          hintText: 'Enter password',
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
                      Checkbox(value: checkBox, onChanged: (val) {
                        setState(() {
                          checkBox=val!;
                        });
                      }),
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

                          context.read<AuthCubit>().login(
                              email: email,
                              password: password,
                              context: context);

                          if(checkBox==true){

                            //todo action
                          }

                          else {

                            // todo another action
                          }
                        }
                      },
                      buttonText: 'Sign in',
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
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Dont have an account?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              NavigationManager.navigateToPage(
                                  context: context, routeName: 'signupScreen');
                            },
                            child: const Text(
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
