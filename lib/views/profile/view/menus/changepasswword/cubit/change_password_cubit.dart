import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/changepasswword/state/change_password_state.dart';

class ChnagePasswordCubit extends Cubit<ChangePasswordState>{
  ChnagePasswordCubit():super(ChangePasswordInitialState(),);
}