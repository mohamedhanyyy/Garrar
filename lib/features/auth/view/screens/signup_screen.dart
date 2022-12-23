import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_input_decoration.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/utils/icons.dart';
import '../../cubit/auth_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  String name = "";

  String companyName = '';

  String email = '';

  String phoneNumber = '';

  String password = '';

  bool isVisible = true;

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
                    padding: EdgeInsets.only(top: 70.h, bottom: 15.h),
                    child: Text(
                      ('Create Your Account'.tr()),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      name = val!;
                    },
                    decoration: customInputDecoration(
                      hintText: ('Full name'.tr()),
                      prefixIcon: IconsManager.person,
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return ('Empty name'.tr());
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      bottom: 17.h,
                    ),
                    child: TextFormField(
                      onSaved: (val) {
                        companyName = val!;
                      },
                      decoration: customInputDecoration(
                        hintText: ('Company name'.tr()),
                        prefixIcon: IconsManager.building,
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return ('Empty Company name'.tr());
                        }
                        return null;
                      },
                    ),
                  ),
                  IntlPhoneField(
                    textInputAction: TextInputAction.done,
                    invalidNumberMessage: ('Invalid number'.tr()),
                    pickerDialogStyle: PickerDialogStyle(
                        searchFieldInputDecoration:
                            InputDecoration(hintText: ('search country'.tr()))),
                    decoration: InputDecoration(
                      labelText: ('Phone Number'.tr()),
                      labelStyle: const TextStyle(color: Colors.grey),
                      fillColor: ColorsManager.gray,
                      filled: true,
                      hintStyle: const TextStyle(color: ColorsManager.gray),
                      border: customOutlineInputBorder,
                    ),
                    onSaved: (phone) {
                      phoneNumber = phone!.number;
                    },
                    validator: (val) {
                      if (val!.number.isEmpty) {
                        return ('Empty number'.tr());
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 17,
                    ),
                    child: TextFormField(
                      onSaved: (val) {
                        email = val!;
                      },
                      decoration: customInputDecoration(
                        hintText: ('Email'.tr()),
                        prefixIcon: IconsManager.mailCard,
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return ('Empty email'.tr());
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 17,
                    ),
                    child: TextFormField(
                      obscureText: isVisible,
                      onSaved: (val) {
                        password = val!;
                      },
                      decoration: InputDecoration(
                        border: customOutlineInputBorder,
                        enabledBorder: customOutlineInputBorder,
                        disabledBorder: customOutlineInputBorder,
                        errorBorder: customOutlineInputBorder,
                        filled: true,
                        fillColor: ColorsManager.gray,
                        hintText: ('Password'.tr()),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return ('Empty password'.tr());
                        }
                        if (val.length < 6) {
                          return ('Password at least 6 characters'.tr());
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:   EdgeInsets.only(
                      top: 10.h,
                      bottom: 15.h,
                    ),
                    child: CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          context.read<AuthCubit>().signup(
                                email: email,
                                password: password,
                                name: name,
                                companyName: companyName,
                                phoneNumber: phoneNumber,
                                context: context,
                              );
                        }
                      },
                      buttonText: 'Sign up',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        ('Already have an account ?'.tr()),
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorsManager.primary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationManager.navigateToPage(
                              context: context, routeName: 'loginScreen');
                        },
                        child: Text(
                          ('Login'.tr()),
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
