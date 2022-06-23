import 'package:bloc/bloc.dart';
import 'package:exam/views/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeInitialState(),
        );

  int currentindex = 0;

  void changetheIndex({required int index}) {
    if (index == 0) {
      currentindex = index;
      emit(
        HomeInitialState(),
      );
    } else if (index == 1) {
      currentindex = index;
      emit(
        HomeExploreState(),
      );
    } else if (index == 2) {
      currentindex = index;
      emit(
        HomeCartState(),
      );
    } else {
      currentindex = index;
      emit(
        HomeProfileState(),
      );
    }
  }
}
