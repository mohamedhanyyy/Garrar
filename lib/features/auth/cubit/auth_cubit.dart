import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/constants/api_end_points.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';
import 'package:garrar/core/widgets/custom_snack_bar.dart';
import 'package:garrar/features/auth/cubit/auth_state.dart';

import '../../../core/helpers/dio_helper.dart';

class AuthCubit extends Cubit<LoginState> {
  AuthCubit() : super(LoginInitial());

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    DioHelper.postData(ApiEndPoints.loginUrl, {
      'email': 'tttt@sdsdfsd.vom',
      'password': 'password',
    }, {
      "X-Requested-With": "XMLHttpRequest",
    }).then((value) {
      if (value?.statusCode == 200) {
        PreferencesHelper.saveToken(token: 'token');

        showCustomSnackBar(text: 'Logged in successfully'.tr());

        NavigationManager.navigateReplacementToPage(
            context: context, routeName: 'verifyEmailScreen');
      }
    }).catchError((error) {
      showCustomSnackBar(
          text: error.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.black);
    });
  }

  void signup({
    required String email,
    required String password,
    required String name,
    required String companyName,
    required String phoneNumber,
    required BuildContext context,
  }) {
    DioHelper.postData(ApiEndPoints.registerUrl, {
      'first_name': name.split(" ").first,
      'last_name': name.split(" ").last,
      'password': password,
      'email': email,
      'country_code': '+20',
      'mobile': phoneNumber,
      'password_confirmation': password,
    }, {
      "Accept": "application/json",
    }).then((value) {
      if (value?.statusCode == 200) {
        PreferencesHelper.saveToken(token: 'token');
        showCustomSnackBar(text: 'Account created successfully'.tr());
        NavigationManager.navigateReplacementToPage(
            context: context, routeName: 'verifyEmailScreen');
      }
    }).catchError((error) {
      showCustomSnackBar(
          text: error.message,
          textColor: Colors.black,
          backgroundColor: Colors.red);
    });
  }

  void resetEmail({required String email}) {
    //todo here
  }

  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) async {
    await DioHelper.postData(ApiEndPoints.changePasswordUrl, {
      'old_password': oldPassword,
      'password': newPassword,
      'password_confirmation': newPassword
    }, {
      "Accept": "application/json",
    }).then((value) {
      if (value?.statusCode == 200) {
        showCustomSnackBar(text: 'Password Changed successfully'.tr());
      }
    }).catchError((error) {
      showCustomSnackBar(
          text: error.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.black);
    });
  }

  void verifyEmail({required String email, required String otp}) {
    //todo
  }
}
