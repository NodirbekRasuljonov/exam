import 'package:exam/views/profile/view/menus/orders/cubit/orders_subit.dart';
import 'package:exam/views/profile/view/menus/orders/state/orders_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit,OrdersState>(builder: (context,state){
      return Scaffold(
appBar: ProfileAppBar.myAppBar(title: 'My Orders', context: context),
      );
    }, listener: (context,state){},);
  }
}