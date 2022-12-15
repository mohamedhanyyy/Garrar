import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<LoginState> {
  AuthCubit() : super(LoginInitial());

  void login({required String email, required String password}) {
    //todo here
  }

  void signup({
    required String email,
    required String password,
    required String name,
    required String companyName,
    required String phoneNumber,
  }) {
    //todo here
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
