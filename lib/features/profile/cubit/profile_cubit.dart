

import 'package:bloc/bloc.dart';
import 'package:garrar/features/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial());
}