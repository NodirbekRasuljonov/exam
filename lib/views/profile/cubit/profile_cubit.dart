import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
}
