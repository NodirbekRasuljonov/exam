import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/orders/state/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit()
      : super(
          OrdersOngoingState(),
        );

  int currentindex = 0;

  void changeTabs({required int index}) {
    if (index == 0) {
      currentindex = index;
      emit(
        OrdersOngoingState(),
      );
    } else if (index == 1) {
      currentindex = index;
      emit(
        OrdersHistoryState(),
      );
    }
  }
}
