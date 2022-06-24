import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/editprofile/state/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState>{
  EditProfileCubit():super(EditProfileInitialState());
}