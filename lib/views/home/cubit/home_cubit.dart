import 'package:bloc/bloc.dart';
import 'package:exam/views/home/state/home_state.dart';
import 'package:flutter/cupertino.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeInitialState(),
        );

  int currentindex = 0;

  int number=1;
  void add(){
    number+=1;
    emit(HomeInitialState(),);
  }

  void remove(){
    number-=1;
    emit(HomeInitialState(),);
  }

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


  String tashkent='tashkent';
  String london='london';

  void changeLocation({required value,required List<String> v}){
    if(v[0]=='tashkent'){
      v[0]=value;
    emit(HomeInitialState(),);
    }
    else if(v[1]=='london'){
      v[0]=value;
    emit(HomeInitialState(),);

    }

    
  }

  void go(BuildContext context){
    Navigator.pushNamed(context, '/cat');
  }
}
