import 'package:bloc/bloc.dart';
import 'package:exam/views/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeInitialState(),
        );


        int currentindex=0;

  void changetheIndex({required int index}){
    currentindex=index;
    emit(HomeInitialState());

  }
}
