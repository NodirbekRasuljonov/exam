import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/orders/state/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState>{
  OrdersCubit():super(OrdersInitialState(),);
}