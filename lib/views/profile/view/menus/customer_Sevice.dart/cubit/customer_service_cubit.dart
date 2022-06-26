import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/customer_Sevice.dart/state/customer_service_state.dart';

class CustomerServiceCubit extends Cubit<CustomerServiceState>{
  CustomerServiceCubit():super(CustomerServiceInitialState());
}