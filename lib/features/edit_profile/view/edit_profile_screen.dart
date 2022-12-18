import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/widgets/back_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/widgets/custom_input_decoration.dart';

class EditProfileScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String name = "";

  String companyName = '';

  String email = '';

  String phoneNumber = '';

  String password = '';

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:   BackButtonWidget(context: context),
      ),
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
                    padding: EdgeInsets.only(top: 85.h, bottom: 30.h),
                    child: const Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      name = val!;
                    },
                    decoration: customInputDecoration(
                      hint: 'Edit name',
                      prefix: IconsManager.person,
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Empty name';
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
                        companyName = val!;
                      },
                      decoration: customInputDecoration(
                        hint: 'Edit Company name',
                        prefix: IconsManager.building,
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty company name';
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
                      onSaved: (val) {
                        email = val!;
                      },
                      decoration: customInputDecoration(
                        hint: 'Edit email',
                        prefix: IconsManager.mailCard,
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty email';
                        }
                        return null;
                      },
                    ),
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Edit Phone Number',
                      fillColor: ColorsManager.gray,
                      filled: true,
                      border: customOutlineInputBorder,
                    ),
                    onSaved: (phone) {
                      phoneNumber = phone!.number;
                    },
                    validator: (val) {
                      if (val!.number.isEmpty) {
                        return 'Empty number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50), // NEW

                              backgroundColor: ColorsManager.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {
                            // todo edit here
                          },
                          child: const Text("Edit"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50), // NEW
                              backgroundColor: ColorsManager.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {
                            NavigationManager.navigateToPage(
                                context: context,
                                routeName: "changePasswordScreen");
                          },
                          child: const Text("Change Password"),
                        ),
                      ),
                    ],
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
