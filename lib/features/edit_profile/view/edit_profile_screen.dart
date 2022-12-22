import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/widgets/back_button.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
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
        leading: BackButtonWidget(context: context),
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
                    child: Text(
                      ('Edit profile'.tr()),
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 25.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      name = val!;
                    },
                    decoration: customInputDecoration(
                      hintText: 'Edit name',
                      prefixIcon: IconsManager.person,
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Empty name'.tr();
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
                        hintText: 'Edit Company name',
                        prefixIcon: IconsManager.building,
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return ('Empty company name'.tr());
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
                        hintText: 'Edit email',
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
                              minimumSize: Size.fromHeight(50.h), // NEW

                              backgroundColor: ColorsManager.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              )),
                          onPressed: () {
                            // todo edit here
                          },
                          child: Text(("Edit".tr())),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50.h), // NEW
                            backgroundColor: ColorsManager.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          onPressed: () {
                            NavigationManager.navigateToPage(
                                context: context,
                                routeName: "changePasswordScreen");
                          },
                          child: Text(("Change password".tr()),
                              textAlign: TextAlign.center),
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
