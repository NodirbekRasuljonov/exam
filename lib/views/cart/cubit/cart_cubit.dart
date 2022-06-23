import 'package:bloc/bloc.dart';
import 'package:exam/views/cart/state/cart_state.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit():super(CartInitialState(),);
}