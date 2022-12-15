import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/features/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());



}
