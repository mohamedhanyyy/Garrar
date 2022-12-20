import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/core/config/navigation.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';
import 'package:garrar/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<LoginState> {
  AuthCubit() : super(LoginInitial());

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    //todo here
    PreferencesHelper.saveToken(token: 'token');

    NavigationManager.navigateReplacementToPage(
        context: context, routeName: 'verifyEmailScreen');
  }

  void signup({
    required String email,
    required String password,
    required String name,
    required String companyName,
    required String phoneNumber,
    required BuildContext context,
  }) {
    PreferencesHelper.saveToken(token: 'token');
    //todo here
    NavigationManager.navigateReplacementToPage(
        context: context, routeName: 'verifyEmailScreen');
  }

  void resetEmail({required String email}) {
    //todo here
  }

  void changePassword(
      {required String oldPassword, required String newPassword}) {
    //todo here
  }

  void verifyEmail({required String email, required String otp}) {
    //todo here
  }
}
