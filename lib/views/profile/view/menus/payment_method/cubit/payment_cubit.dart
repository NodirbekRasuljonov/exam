import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/payment_method/state/payment_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState>{
  PaymentMethodCubit():super(PaymentMethodInitialState());
}