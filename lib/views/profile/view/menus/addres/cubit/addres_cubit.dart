import 'package:exam/views/profile/view/menus/addres/state/addres_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddresState>{
AddressCubit():super(AddressInitialState());
}