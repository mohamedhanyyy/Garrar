import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/utils/colors.dart';
import 'package:garrar/core/utils/extensions.dart';
import 'package:garrar/core/widgets/custom_button.dart';
import 'package:garrar/core/widgets/custom_text_field.dart';

import '../../../../core/widgets/back_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool visibility1 = true;
  bool visibility2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const SizedBox(width: 18, height: 12, child: BackButtonWidget()),
        title: Text(
          "Change Password",
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
                    'Please set current and new password',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  ),
                ),
                TextFormField(
                  obscureText: visibility1,
                  decoration: InputDecoration(
                    hintText: 'Current password',
                    filled: true,
                    fillColor: ColorsManager.gray,
                    border: customOutlineInputBorder,
                    enabledBorder: customOutlineInputBorder,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(visibility1
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          visibility1 = !visibility1;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 17,
                  ),
                  child: TextFormField(
                    obscureText: visibility2,
                    decoration: InputDecoration(
                      hintText: 'New password',
                      filled: true,
                      fillColor: ColorsManager.gray,
                      border: customOutlineInputBorder,
                      enabledBorder: customOutlineInputBorder,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(visibility2
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            visibility2 = !visibility2;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 38,
                  ),
                  child: CustomButton(
                    onTap: () {},
                    buttonText: 'Change password',
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
