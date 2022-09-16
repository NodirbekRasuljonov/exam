import 'package:bloc/bloc.dart';
import 'package:exam/main/state/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInittialState(),);


  bool isDark=true;
}
 