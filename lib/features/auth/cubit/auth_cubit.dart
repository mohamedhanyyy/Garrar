import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<LoginState> {
  AuthCubit() : super(LoginInitial());
}
