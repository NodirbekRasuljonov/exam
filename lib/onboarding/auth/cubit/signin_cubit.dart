import 'package:bloc/bloc.dart';
import 'package:exam/onboarding/auth/state/signin_state.dart';

class SignInCubit extends Cubit<SignInState>{
  SignInCubit():super(SignInInitialState(),);
}