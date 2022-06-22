import 'package:bloc/bloc.dart';
import 'package:exam/onboarding/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthInitialState(),);


  bool agreeTerms=false;

  void checkBox({required v}){
    agreeTerms=v;
    emit(AuthInitialState());
  }
}